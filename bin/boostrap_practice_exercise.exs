# Generate all files required for a practice exercise.
# File content is filled as much as possible, but some, including tests, need manual input.
#
# Run the following command from the root of the repo:
# $ elixir bin/boostrap_practice_exercise.exs complex-numbers
# Pass the name of the exercise (e. g., "complex-numbers") as an argument

defmodule Generate do
  def to_snake_case(lower_camel_case) do
    lower_camel_case
    |> String.split(~r/(?=[A-Z\d])/)
    |> Enum.map_join("_", &String.downcase/1)
  end

  def get_properties(%{"cases" => cases}) when is_list(cases) do
    Enum.map(cases, &Generate.get_properties/1)
    |> Enum.concat()
    |> Enum.uniq()
  end

  def get_properties(%{"property" => property, "input" => %{} = input}),
    do: [
      {property,
       Enum.map(input, fn
         {var, %{} = val} -> {var, Enum.map(val, fn {v, _} -> v end)}
         {var, _} -> {var, nil}
       end)}
    ]

  def get_properties(%{"property" => property}), do: [{property, "input"}]
  def get_properties(_data), do: []

  def print_property({property, variables}) do
    """
     @doc \"\"\"
     insert function description here
     \"\"\"
     @spec #{property}(#{Enum.map_join(variables, ", ", fn
      {var, nil} -> "#{var} :: String.t()"
      {var, sub_vars} -> "#{var} :: {#{Enum.map_join(sub_vars, " :: String.t(), ", fn v -> v end)} :: String.t()}"
    end)}) :: {:ok, String.t()} | {:error, String.t()}
     def #{property}(#{Enum.map_join(variables, ", ", fn {var, _} -> var end)}) do
     end
    """
  end

  def print_comments(comments, do_not_print) do
    comments
    |> Enum.reject(fn {field, _value} -> field in do_not_print end)
    |> Enum.map_join("\n", fn
      {"comments", values} when is_list(values) ->
        "# #{Enum.join(String.trim(values), "\n# ")}"

      {field, values} when is_list(values) ->
        "#\n# --#{field} --\n# #{Enum.map_join(values, "\n# ", &inspect/1)}"

      {field, value} ->
        "#\n# -- #{field} --\n# #{inspect(value)}"
    end)
  end

  def print_input(%{} = input) do
    Enum.map_join(input, "\n", fn {variable, value} -> "#{variable} = #{inspect(value)}" end)
  end

  def print_input(input), do: "input = #{inspect(input)}"

  def print_variables(%{} = input),
    do: Enum.map_join(input, ", ", fn {variable, _value} -> variable end)

  def print_variables(input), do: input

  def print_expected(%{"error" => err}), do: "{:error, #{inspect(err)}}"
  def print_expected(expected), do: "{:ok, #{inspect(expected)}}"

  def print_test_case(%{"description" => description, "cases" => sub_cases} = c, module) do
    """
    describe \"#{description}\" do
    #{Generate.print_comments(c, ["description", "cases"])}
    #{Enum.map_join(sub_cases, "\n\n", &Generate.print_test_case(&1, module))}
    end
    """
  end

  def print_test_case(
        %{
          "description" => description,
          "property" => property,
          "input" => input,
          "expected" => expected
        } = c,
        module
      ) do
    """
    @tag :pending
    test \"#{description}\" do
      #{Generate.print_comments(c, ["description", "property", "input", "expected", "uuid"])}
      #{print_input(input)}
      output = #{module}.#{Generate.to_snake_case(property)}(#{print_variables(input)})
      expected = #{print_expected(expected)}

      assert output == expected
    end
    """
  end
end

Mix.install([
  {:jason, "~> 1.2"},
  {:toml, "~> 0.6"}
])

[exercise] = System.argv()

exercise_path = String.replace(exercise, "-", "_")

module =
  exercise
  |> String.split("-")
  |> Enum.map_join("", &String.capitalize/1)

## Step 1: create folder structure

Mix.Generator.create_directory("exercises/practice/#{exercise}")
Mix.Generator.create_directory("exercises/practice/#{exercise}/.docs")
Mix.Generator.create_directory("exercises/practice/#{exercise}/.meta")
Mix.Generator.create_directory("exercises/practice/#{exercise}/lib")
Mix.Generator.create_directory("exercises/practice/#{exercise}/test")

## Step 2: add common files

# .formatter.exs
format = """
# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"]
]
"""

Mix.Generator.create_file("exercises/practice/#{exercise}/.formatter.exs", format)

# mix.exs
mix = """
defmodule #{module}.MixProject do
  use Mix.Project

  def project do
    [
      app: :#{exercise_path},
      version: "0.1.0",
      # elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
"""

Mix.Generator.create_file("exercises/practice/#{exercise}/mix.exs", mix)

# test/test_helper.exs
test_helper = """
ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)
"""

Mix.Generator.create_file("exercises/practice/#{exercise}/test/test_helper.exs", test_helper)

## Step 3: write files that depend on problem specifications

url =
  'https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/#{exercise}'

:inets.start()
:ssl.start()

# .docs/instructions.md
{:ok, {_status, _header, description}} =
  :httpc.request(:get, {url ++ '/description.md', []}, [], [])

Mix.Generator.create_file("exercises/practice/#{exercise}/.docs/instructions.md", description)

# .meta/config.json
{:ok, {_status, _header, metadata}} = :httpc.request(:get, {url ++ '/metadata.toml', []}, [], [])

metadata =
  metadata
  |> to_string
  |> Toml.decode!()

config = %{
  authors: [],
  contributors: [],
  files: %{
    solution: ["lib/#{exercise_path}.ex"],
    test: ["test/#{exercise_path}_test.exs"],
    example: [".meta/example.ex"]
  }
}

config =
  Map.merge(metadata, config)
  |> Jason.encode!(pretty: true)

Mix.Generator.create_file("exercises/practice/#{exercise}/.meta/config.json", config)
IO.puts("Don't forget to add your name and the names of contributors")

# tests and lib files
{:ok, {_status, _header, data}} =
  :httpc.request(:get, {url ++ '/canonical-data.json', []}, [], [])

data = Jason.decode!(data)

# Generating lib file
lib_file = """
defmodule #{module} do

#{data |> Generate.get_properties() |> Enum.map_join("\n\n", &Generate.print_property/1)}

end
"""

path = "exercises/practice/#{exercise}/lib/#{exercise_path}.ex"
Mix.Generator.create_file(path, lib_file)
System.cmd("mix", ["format", path])

Mix.Generator.copy_file(path, "exercises/practice/#{exercise}/.meta/example.ex")

# Generating test file
test_file =
  """
  defmodule #{module}Test do
    use ExUnit.Case

    #{Generate.print_comments(data, ["cases", "exercise"])}
    #{Enum.map_join(data["cases"], "\n\n", &Generate.print_test_case(&1, module))}
  end
  """
  |> String.replace("@tag", "# @tag", global: false)

path = "exercises/practice/#{exercise}/test/#{exercise_path}_test.exs"
Mix.Generator.create_file(path, test_file)
System.cmd("mix", ["format", path])

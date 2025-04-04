# Generate all files required for a practice exercise.
# File content is filled as much as possible, but some, including tests, need manual input.
#
# Do not run directly, instead use this script:
# $ bin/generate_practice_exercise.sh complex-numbers
# Pass the name of the exercise (e. g., "complex-numbers") as an argument

Mix.install([
  {:jason, "~> 1.2"},
  {:toml, "~> 0.6"}
])

defmodule Generate do
  def explore_properties(%{"cases" => cases}) when is_list(cases) do
    Enum.map(cases, &Generate.explore_properties/1)
    |> Enum.reduce(
      %{},
      &Map.merge(&1, &2, fn _prop, p1, p2 -> %{p1 | error: p1.error or p2.error} end)
    )
  end

  def explore_properties(%{"property" => property, "input" => input, "expected" => expected}),
    do: %{
      property => %{
        name: Macro.underscore(property),
        variables:
          if match?(%{}, input) do
            Enum.map(input, fn
              {var, %{} = val} ->
                {Macro.underscore(var), Enum.map(val, fn {v, _} -> Macro.underscore(v) end)}

              {var, _} ->
                {Macro.underscore(var), nil}
            end)
          else
            [{"input", nil}]
          end,
        error: match?(%{"error" => _err}, expected)
      }
    }

  def explore_properties(_data), do: %{}

  def print_property(%{name: name, variables: variables, error: error}) do
    return_type = if error, do: "{:ok, TODO.t()} | {:error, String.t()}", else: "TODO.t()"

    variable_types =
      Enum.map_join(variables, ", ", fn
        {var, nil} ->
          "#{var} :: TODO.t()"

        {var, sub_vars} ->
          "#{var} :: %{#{Enum.map_join(sub_vars, ", ", &(&1 <> ": TODO.t()"))}}"
      end)

    variable_list = Enum.map_join(variables, ", ", fn {var, _} -> var end)

    """
     @doc \"\"\"
     TODO: add function description and replace types in @spec
     \"\"\"
     @spec #{name}(#{variable_types}) :: #{return_type}
     def #{name}(#{variable_list}) do
     end
    """
  end

  def print_comments(comments, do_not_print) do
    comments
    |> Enum.reject(fn {field, _value} -> field in do_not_print end)
    |> Enum.map_join("\n", fn
      {"comments", values} when is_list(values) ->
        "# #{Enum.map_join(values, "\n# ", &String.trim/1)}"

      {field, values} when is_list(values) ->
        "#\n# --#{field} --\n# #{Enum.map_join(values, "\n# ", &inspect(&1, limit: :infinity))}"

      {field, value} ->
        "#\n# -- #{field} --\n# #{inspect(value, limit: :infinity)}"
    end)
  end

  def print_input(%{} = input),
    do:
      Enum.map_join(input, "\n", fn {variable, value} ->
        "#{Macro.underscore(variable)} = #{inspect(value, limit: :infinity)}"
      end)

  def print_input(input), do: "input = #{inspect(input, limit: :infinity)}"

  def print_expected(%{"error" => err}, _error), do: "{:error, #{inspect(err, limit: :infinity)}}"
  def print_expected(expected, true), do: "{:ok, #{inspect(expected, limit: :infinity)}}"
  def print_expected(expected, false), do: inspect(expected, limit: :infinity)

  def print_test_case(
        %{"description" => description, "cases" => sub_cases} = category,
        properties,
        module
      ) do
    """
    describe \"#{description}\" do
    #{Generate.print_comments(category, ["description", "cases"])}
    #{Enum.map_join(sub_cases, "\n\n", &Generate.print_test_case(&1, properties, module))}
    end
    """
  end

  def print_test_case(
        %{
          "description" => description,
          "property" => property,
          "input" => input,
          "expected" => expected
        } = test,
        properties,
        module
      ) do
    %{name: name, variables: variables, error: error} = properties[property]
    variable_list = Enum.map_join(variables, ", ", fn {var, _} -> var end)

    """
    @tag :pending
    test \"#{description}\" do
      #{Generate.print_comments(test, ["description", "property", "input", "expected", "uuid"])}
      #{print_input(input)}
      output = #{module}.#{name}(#{variable_list})
      expected = #{print_expected(expected, error)}

      assert output == expected
    end
    """
  end
end

[exercise] = System.argv()

exercise_snake_case = String.replace(exercise, "-", "_")

module =
  exercise
  |> String.split("-")
  |> Enum.map_join("", &String.capitalize/1)

## Step 1: create folder structure

File.cd!("exercises/practice/#{exercise}")
Mix.Generator.create_directory("lib")
Mix.Generator.create_directory("test")

## Step 2: add common files

# .formatter.exs
format = """
# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"]
]
"""

Mix.Generator.create_file(".formatter.exs", format)

# mix.exs
mix = """
defmodule #{module}.MixProject do
  use Mix.Project

  def project do
    [
      app: :#{exercise_snake_case},
      version: "0.1.0",
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

Mix.Generator.create_file("mix.exs", mix)

# .gitignore
gitignore = """
# The directory Mix will write compiled artifacts to.
/_build/

# If you run "mix test --cover", coverage assets end up here.
/cover/

# The directory Mix downloads your dependencies sources to.
/deps/

# Where third-party dependencies like ExDoc output generated docs.
/doc/

# Ignore .fetch files in case you like to edit your project deps locally.
/.fetch

# If the VM crashes, it generates a dump, let's ignore it too.
erl_crash.dump

# Also ignore archive artifacts (built via "mix archive.build").
*.ez

# Ignore package tarball (built via "mix hex.build").
#{exercise_snake_case}-*.tar

# Temporary files, for example, from tests.
/tmp/
"""

Mix.Generator.create_file(".gitignore", gitignore)

# test/test_helper.exs
test_helper = """
ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)
"""

Mix.Generator.create_file("test/test_helper.exs", test_helper)

## Step 3: write files that depend on problem specifications

url =
  ~c"https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/#{exercise}"

:inets.start()
:ssl.start()

# tests and lib files
{:ok, {_status, _header, data}} =
  :httpc.request(:get, {url ++ ~c"/canonical-data.json", []}, [], [])

data = Jason.decode!(data)

properties = Generate.explore_properties(data)

# Generating lib file
lib_file = """
defmodule #{module} do

#{properties |> Map.values() |> Enum.map_join("\n\n", &Generate.print_property/1)}

end
"""

path = "lib/#{exercise_snake_case}.ex"
Mix.Generator.create_file(path, lib_file)

Mix.Generator.copy_file(path, ".meta/example.ex")

# Generating test file
test_file =
  """
  defmodule #{module}Test do
    use ExUnit.Case

    #{Generate.print_comments(data, ["cases", "exercise"])}
    #{Enum.map_join(data["cases"], "\n\n", &Generate.print_test_case(&1, properties, module))}
  end
  """
  |> String.replace("@tag", "# @tag", global: false)

path = "test/#{exercise_snake_case}_test.exs"
Mix.Generator.create_file(path, test_file)

# mix format all files
Mix.Tasks.Format.run(["**/*.{ex,exs}"])

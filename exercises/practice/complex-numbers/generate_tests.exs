# Generates test cases and basic template, which will need to be adapted by hand
# Pass the name of the exercise (e. g, "complex-numbers") as an argument

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
    do: [{property, map_size(input)}]

  def get_properties(%{"property" => property}), do: [{property, 1}]
  def get_properties(_data), do: []

  def print_property({property, num_variables}) do
    variables = Enum.map(1..num_variables, fn n -> to_string([?a - 1 + n]) end)

    """
     @doc \"\"\"
     insert function description here
     \"\"\"
     @spec #{property}(#{Enum.map_join(variables, ", ", fn var -> "#{var} :: #{var}_type()" end)}) :: {:ok, return_type()} | {:error, String.t()}
     def #{property}(#{Enum.join(variables, ", ")}) do
     end
    """
  end

  def print_comments(comments, do_not_print) do
    comments
    |> Enum.reject(fn {field, _value} -> field in do_not_print end)
    |> Enum.map_join("\n", fn
      {"comments", values} when is_list(values) ->
        "# #{Enum.join(values, "\n# ")}"

      {field, values} when is_list(values) ->
        "#\n# --#{field} -- \n# #{Enum.map_join(values, "\n# ", &inspect/1)}"

      {field, value} ->
        "#\n# -- #{field} --\n# #{inspect(value)}"
    end)
  end

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
          "input" => %{} = input,
          "expected" => expected
        } = c,
        module
      ) do
    """
    @tag :pending
    test \"#{description}\" do
      #{Generate.print_comments(c, ["description", "property", "input", "expected", "uuid"])}
        #{for {variable, value} <- input do
      "#{variable} = #{inspect(value)}"
    end |> Enum.join("\n")}
      output = #{module}.#{Generate.to_snake_case(property)}(#{for {variable, _value} <- input do
      variable
    end |> Enum.join(", ")})
      expected = #{inspect(expected)}

      assert output == expected
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
      input = #{inspect(input)}
      output = #{module}.#{Generate.to_snake_case(property)}(input)
      expected = #{inspect(expected)}

      assert output == expected
    end
    """
  end
end

Mix.install([
  {:jason, "~> 1.2"}
])

[exercise] = System.argv()

url =
  'https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/#{exercise}/canonical-data.json'

:inets.start()
:ssl.start()
{:ok, {_status, _header, file}} = :httpc.request(:get, {url, []}, [], [])

data = Jason.decode!(file)

module =
  exercise
  |> String.split("-")
  |> Enum.map_join("", &String.capitalize/1)

# Generating lib file
path = "lib/#{String.replace(exercise, "-", "_")}.ex"

lib_file = """
defmodule #{module} do

#{data |> Generate.get_properties() |> Enum.map_join("\n\n", &Generate.print_property/1)}

end
"""

File.write!(path, lib_file)
System.cmd("mix", ["format", path])

# Generating test file
path = "test/#{String.replace(exercise, "-", "_")}_test.exs"

test_file =
  """
  defmodule #{module}Test do
    use ExUnit.Case

    #{Generate.print_comments(data, ["cases", "exercise"])}
    #{Enum.map_join(data["cases"], "\n\n", &Generate.print_test_case(&1, module))}
  end
  """
  |> String.replace("@tag", "# @tag", global: false)

File.write!(path, test_file)
System.cmd("mix", ["format", path])

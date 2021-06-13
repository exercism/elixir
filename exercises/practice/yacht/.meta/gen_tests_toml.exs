# Generate tests.toml file from canonical-data.json
# $ mix run .meta/gen_tests_toml.exs priv/canonical-data.json .meta/tests.toml

Mix.install([{:jason, "~> 1.2"}])

args = System.argv()

if length(args) != 2 do
  IO.puts("""
  This script requires two positional arguments:

  1. the path to the `canonical-data.json` file to read the tests from
  2. the path to the `tests.toml` file to write to

  $ mix run .meta/gen_tests_toml.exs priv/canonical-data.json .meta/tests.toml
  """)

  System.halt(1)
end

[data_file, test_file] = args

tests =
  File.read!(data_file)
  |> Jason.decode!()
  |> Map.get("cases")

intro = """
# This is an auto-generated file. Regular comments will be removed when this
# file is regenerated. Regenerating will not touch any manually added keys,
# so comments can be added in a "comment" key.

"""

tests_toml =
  Enum.reduce(tests, intro, fn test, tests_toml ->
    uuid = test["uuid"]
    desc = test["description"]

    tests_toml <>
      """
      [#{uuid}]
      description = "#{desc}"

      """
  end)

File.write!(test_file, tests_toml)

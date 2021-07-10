Mix.install([
  {:jason, "~> 1.2"}
])

{opts, _} =
  OptionParser.parse!(
    System.argv(),
    strict: [write: :boolean],
    aliases: [w: :write]
  )

max_custom_order = 999

config =
  "./config.json"
  |> File.read!()
  |> Jason.decode!()

sort_by = fn exercise ->
  {exercise["difficulty"], exercise["order"] || max_custom_order, exercise["slug"]}
end

reordered_config =
  put_in(
    config,
    ["exercises", "practice"],
    Enum.sort_by(config["exercises"]["practice"], sort_by)
  )

desired_exercise_order =
  reordered_config
  |> get_in(["exercises", "practice"])
  |> Enum.map(& &1["slug"])

actual_exercise_order =
  config
  |> get_in(["exercises", "practice"])
  |> Enum.map(& &1["slug"])

if opts[:write] do
  # set order to a value if missing because otherwise it's null and null comes before 1
  {file_with_order_field, 0} =
    System.cmd("jq", [
      ".exercises.practice[] |= if .order==null then . + {order: #{max_custom_order + 1}} else . + {order: .order} end",
      "config.json"
    ])

  File.write!("config.json", file_with_order_field)

  # reorder exercises based on difficulty, custom order overwrites, and slug
  {reordered_file, 0} =
    System.cmd("jq", [".exercises.practice |= sort_by(.difficulty, .order, .slug)", "config.json"])

  File.write!("config.json", reordered_file)

  # remove fields added in the first step
  {reordered_without_order_field_file, 0} =
    System.cmd("jq", [
      ".exercises.practice[] |= if .order > #{max_custom_order} then del(.order) else . end",
      "config.json"
    ])

  File.write!("config.json", reordered_without_order_field_file)
else
  if desired_exercise_order === actual_exercise_order do
    IO.write("Practice exercises are ordered #{IO.ANSI.green()}✔#{IO.ANSI.reset()}\n")
  else
    IO.write("Practice exercises are not ordered #{IO.ANSI.red()}⨯#{IO.ANSI.reset()}\n")
    IO.write("Rerun this script with --write to fix that.\n")
    exit(1)
  end
end

Mix.install([
  {:jason, "~> 1.2"}
])

{opts, _} =
  OptionParser.parse!(
    System.argv(),
    strict: [write: :boolean],
    aliases: [w: :write]
  )

config =
  "./config.json"
  |> File.read!()
  |> Jason.decode!()

sort_by = fn exercise ->
  {exercise["difficulty"], exercise["name"]}
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
  {reordered_file, 0} =
    System.cmd("jq", [".exercises.practice|=sort_by(.difficulty, .name)", "config.json"])

  File.write!("config.json", reordered_file)
else
  if desired_exercise_order === actual_exercise_order do
    IO.write("Practice exercises are ordered #{IO.ANSI.green()}✔#{IO.ANSI.reset()}\n")
  else
    IO.write("Practice exercises are not ordered #{IO.ANSI.red()}⨯#{IO.ANSI.reset()}\n")
    IO.write("Rerun this script with --write to fix that.\n")
    exit(1)
  end
end

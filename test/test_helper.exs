active_problems = "config.json" |> File.read! |> Poison.decode! |> Dict.get("problems")

Enum.each active_problems, fn dir ->
  IO.puts "********* loading tests for " <> dir  <> " ************* "
  "#{dir}/*_test.ex*" |> Path.wildcard |> List.first |> Code.require_file
end

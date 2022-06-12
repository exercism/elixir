defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    String.split(line, ~r/\<([\*\=\-\~])*\>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line(\d)+/i, "")
  end

  def tag_with_user_name(line) do
    result = Regex.run(~r/User\s+(\S+)/, line)

    if result == nil do
      line
    else
      [_ | user_name] = result
      "[USER] #{user_name} #{line}"
    end
  end
end

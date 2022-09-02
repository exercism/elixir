defmodule Grep do
  import Bitwise

  @line_num_flag 1
  @file_name 2
  @case_insensitive 4
  @invert 8
  @entire_lines 16

  defp parse_flag("-n"), do: @line_num_flag
  defp parse_flag("-l"), do: @file_name
  defp parse_flag("-i"), do: @case_insensitive
  defp parse_flag("-v"), do: @invert
  defp parse_flag("-x"), do: @entire_lines
  defp parse_flag(_), do: 0

  defp parse_flags(flags) do
    flags
    |> Enum.map(&parse_flag/1)
    |> Enum.reduce(0, &|||/2)
  end

  defp has_flag(flags, flag), do: (flags &&& flag) > 0

  defp is_match(pattern, flags) do
    pat =
      if has_flag(flags, @entire_lines) do
        "^#{pattern}$"
      else
        pattern
      end

    cas =
      if has_flag(flags, @case_insensitive) do
        "i"
      else
        ""
      end

    regex = Regex.compile!(pat, cas)

    fn line -> Regex.match?(regex, line) != has_flag(flags, @invert) end
  end

  defp matching_lines(pattern, flags, file) do
    match_fn = is_match(pattern, flags)

    File.stream!(file)
    |> Enum.map(fn l -> String.trim_trailing(l, "\n") end)
    |> Enum.with_index(1)
    |> Enum.map(fn {l, i} -> {file, i, l} end)
    |> Enum.filter(fn {_, _, l} -> match_fn.(l) end)
  end

  defp process_files(pattern, flags, files) do
    files
    |> Enum.filter(fn x -> !Enum.empty?(matching_lines(pattern, flags, x)) end)
  end

  defp line_formatter(flags, single_file?) do
    print_nums? = has_flag(flags, @line_num_flag)

    fn {f, ix, l} ->
      case {single_file?, print_nums?} do
        {true, true} -> "#{ix}:#{l}"
        {false, true} -> "#{f}:#{ix}:#{l}"
        {true, false} -> "#{l}"
        {false, false} -> "#{f}:#{l}"
      end
    end
  end

  defp process_lines(pattern, flags, files) do
    fmt = line_formatter(flags, length(files) == 1)

    files
    |> Enum.flat_map(fn x -> matching_lines(pattern, flags, x) end)
    |> Enum.map(fmt)
  end

  @spec grep(String.t(), [String.t()], [String.t()]) :: String.t()
  def grep(pattern, flag_args, files) do
    flags = parse_flags(flag_args)

    output =
      if has_flag(flags, @file_name) do
        process_files(pattern, flags, files)
      else
        process_lines(pattern, flags, files)
      end

    output
    |> Enum.map(fn l -> "#{l}\n" end)
    |> Enum.reduce("", fn b, a -> "#{a}#{b}" end)
  end
end

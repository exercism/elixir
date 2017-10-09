defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) do
    cond do
      base_a > 1 and base_b > 1 and digits != [] ->
        do_convert(digits, base_a, base_b)

      true ->
        nil
    end
  end

  defp do_convert(digits, base_a, base_b) do
    num = convert_to_num(digits, base_a, 0)

    case num do
      nil ->
        nil

      0 ->
        [0]

      num ->
        convert_to_digits(num, base_b, [])
        |> Enum.reverse()
    end
  end

  defp convert_to_num([head | tail], base_a, accumulator) do
    cond do
      head < base_a and head >= 0 ->
        convert_to_num(tail, base_a, accumulator * base_a + head)

      true ->
        nil
    end
  end

  defp convert_to_num([], _base_a, accumulator) do
    accumulator
  end

  defp convert_to_digits(num, base_b, arr) when num > 0 do
    convert_to_digits(div(num, base_b), base_b, arr ++ [rem(num, base_b)])
  end

  defp convert_to_digits(num, _base_b, arr) when num == 0 do
    arr
  end
end

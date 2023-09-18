defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2 do
    {:error, "input base must be >= 2"}
  end

  def convert(_, _, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end

  def convert(digits, input_base, output_base) do
    if Enum.all?(digits, &(0 <= &1 && &1 < input_base)) do
      {:ok, do_convert(digits, input_base, output_base)}
    else
      {:error, "all digits must be >= 0 and < input base"}
    end
  end

  defp do_convert(digits, input_base, output_base) do
    num = convert_to_num(digits, input_base, 0)

    case num do
      0 ->
        [0]

      num ->
        convert_to_digits(num, output_base, [])
        |> Enum.reverse()
    end
  end

  defp convert_to_num([head | tail], input_base, accumulator) do
    convert_to_num(tail, input_base, accumulator * input_base + head)
  end

  defp convert_to_num([], _input_base, accumulator) do
    accumulator
  end

  defp convert_to_digits(num, output_base, arr) when num > 0 do
    convert_to_digits(div(num, output_base), output_base, arr ++ [rem(num, output_base)])
  end

  defp convert_to_digits(num, _output_base, arr) when num == 0 do
    arr
  end
end

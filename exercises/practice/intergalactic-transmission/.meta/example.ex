defmodule Transmission do
  import Bitwise

  @doc """
  Return the transmission sequence for a message.
  """
  @spec get_transmit_sequence(binary()) :: binary()
  def get_transmit_sequence(message) do
    encode(message)
  end

  @spec encode(bitstring(), bitstring()) :: binary()
  defp encode(content, acc \\ <<>>)
  defp encode(<<>>, acc), do: acc

  defp encode(<<next::7, remaining::bitstring>>, acc) do
    encode(remaining, <<acc::bitstring, add_parity(<<next::7>>)::bitstring>>)
  end

  defp encode(<<content::bitstring>>, acc) do
    <<acc::bitstring, add_parity(<<content::bitstring>>)::bitstring>>
  end

  @spec add_parity(bitstring()) :: <<_::8>>
  defp add_parity(data) when bit_size(data) < 8 do
    <<data::bitstring, 0::size(7 - bit_size(data)), get_parity(data)::bitstring>>
  end

  @spec get_parity(bitstring()) :: <<_::1>>
  defp get_parity(data) do
    bit_count = bit_size(data)
    <<value::size(bit_count)>> = data

    parity_int =
      0..(bit_count - 1)
      |> Enum.map(fn
        places ->
          case value &&& 1 <<< places do
            0 -> 0
            _other -> 1
          end
      end)
      |> Enum.reduce(0, fn elem, acc -> bxor(elem, acc) end)

    case parity_int do
      0 -> <<0::1>>
      _ -> <<1::1>>
    end
  end

  @doc """
  Return the message decoded from the received transmission.
  """
  @spec decode_message(binary()) :: {:ok, binary()} | {:error, String.t()}
  def decode_message(<<>>), do: {:ok, <<>>}
  def decode_message(received), do: do_decode(received)

  @spec do_decode(bitstring(), bitstring()) :: {:ok, binary()} | {:error, String.t()}
  defp do_decode(content, acc \\ <<>>)

  defp do_decode(<<data::7, parity::1, remaining::bitstring>>, acc) do
    if get_parity(<<data::7>>) == <<parity::1>> do
      case remaining do
        <<>> -> {:ok, finalize(<<data::7>>, acc)}
        _ -> do_decode(remaining, <<acc::bitstring, data::7>>)
      end
    else
      {:error, "wrong parity"}
    end
  end

  defp finalize(data, acc) when bit_size(data) == 7 do
    bits_count = 8 - rem(bit_size(acc), 8)
    <<head::size(bits_count), _::bitstring>> = data
    <<acc::bitstring, head::size(bits_count)>>
  end
end

defmodule TopSecretTest do
  use ExUnit.Case

  test "TODO: write test suite" do
    code = """
      defmodule TotallyNotTopSecret do
        def force(mass, acceleration), do: mass * acceleration
        def uniform(from, to), do: rand.uniform(to - from) + from
        def data(%{metadata: metadata}), do: model(metadata)
        defp model(metadata), do: metadata |> less_data |> Enum.reverse() |> Enum.take(3)
        defp less_data(data), do: Enum.reject(data, &is_nil/1)
      end
    """

    secret_message = "foundamole"

    assert TopSecret.decode_secret_message(code) == secret_message
  end
end

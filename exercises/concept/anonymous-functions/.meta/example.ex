defmodule Secrets do

  def secret_add(secret) do
    fn x -> x + secret end
  end

  def secret_subtract(secret) do
    fn x -> x - secret end
  end

  def secret_multiply(secret) do
    fn a -> a * secret end
  end

  def secret_divide(secret) do
    fn x -> div(x, secret) end
  end

  def secret_and(secret) do
    fn x -> Bitwise.&&&(x, secret) end
  end

  def secret_xor(secret) do
    fn x -> Bitwise.^^^(x, secret) end
  end

  def secret_combine(f, g) do
    fn x ->
      g.(f.(x))
    end
  end
end

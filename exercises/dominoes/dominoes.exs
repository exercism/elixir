defmodule Dominoes do

  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of integer and returns boolean indicating if chain is possible
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec chain?(dominoes :: [domino] | []) :: boolean
  def chain?(dominoes) do
  end
end

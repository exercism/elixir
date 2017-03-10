defmodule DiffieHellman do
  @moduledoc """
  Diffie-Hellman is a method of securely exchanging keys in a public-key
  cryptosystem. Two users, Alice and Bob, want to share a secret between
  themselves, while ensuring nobody else can read it.

  Step 0: Alice and Bob agree on two prime numbers, P and G. An attacker, Eve,
  can intercept these numbers, but without one of Alice or Bob's private keys,
  we'll see Eve can't do anything useful with them.

  Step 1: Alice and Bob each generate a private key between 1 and P-1.
  P).

  Step 2: Using the initial primes P and G, Alice and Bob calculate their
  public keys by raising G to the power of their private key, then calculating
  the modulus of that number by P. ((G**private_key) % P)

  Step 3: Alice and Bob exchange public keys. Alice and Bob calculate a secret
  shared key by raising the other's public key to the power of their private
  key, then doing a modulus of the result by P. Due to the way modulus math
  works, they should both generate the same shared key.

  Alice calculates: (bob_public ** alice_private) % P
  Bob calculates: (alice_public ** bob_private) % P

  As long as their private keys are never lost or transmitted, only they know
  their private keys, so even if Eve has P, G, and both public keys, she can't
  do anything with them.
  """

  @doc """
  Given a prime integer `prime_p`, return a random integer between 1 and `prime_p` - 1

  HINT: Erlang's `:rand.uniform` is good, `Enum.random` is better
  """
  @spec generate_private_key(prime_p :: integer) :: integer
  def generate_private_key(prime_p) do
    1 |> Range.new(prime_p - 1) |> Enum.random
  end

  @doc """
  Given two prime integers as generators (`prime_p` and `prime_g`), and a private key,
  generate a public key using the mathematical formula:

  (prime_g **  private_key) % prime_p
  """
  @spec generate_public_key(prime_p :: integer, prime_g :: integer, private_key :: integer) :: integer
  def generate_public_key(prime_p, prime_g, private_key) do
    Helpers.mod_pow(prime_g, private_key, prime_p)
  end

  @doc """
  Given a prime integer `prime_p`, user B's public key, and user A's private key,
  generate a shared secret using the mathematical formula:

  (public_key_b ** private_key_a) % prime_p
  """
  @spec generate_shared_secret(prime_p :: integer, public_key_b :: integer, private_key_a :: integer) :: integer
  def generate_shared_secret(prime_p, public_key_b, private_key_a) do
    Helpers.mod_pow(public_key_b, private_key_a, prime_p)
  end
end

defmodule Helpers do
  use Bitwise

  @moduledoc """
  You'll have to do a couple of functions of the form `(A ** B) % C`.

  If you're reading this far down, you've probably run into the fact that
  while Elixir supports arbitrarily large integers, Erlang's `:math.pow`
  fails at a surprisingly low exponent (try `:math.pow(2, 10000)`). Modern
  cryptosystems typically deal with numbers in or over the 1024-bit range,
  so a naive approach will take a LONG time.

  Fortunately, smarter people have figured out the math necessary to do
  modular exponentiation on enormous integers well before the heat death
  of the universe:

  https://en.wikipedia.org/wiki/Modular_exponentiation#Right-to-left_binary_method
  """

  @doc """
  Raise `base` to the power `exp`, then modulus by `mod`.

  Derived from pseudocode based on Applied Cryptography by Bruce Schneier, found
  in the Wikipedia link above.
  """
  def mod_pow(_base, _exp, 1), do: 0
  def mod_pow(base, exp, mod), do: do_mod_pow(rem(base, mod), exp, mod, 1)

  defp do_mod_pow(_base, exp, _mod, result) when exp <= 0, do: result
  defp do_mod_pow(base, exp, mod, result) when rem(exp, 2) == 1, do: do_mod_pow(rem(base*base, mod), exp >>> 1, mod, rem(result * base, mod))
  defp do_mod_pow(base, exp, mod, result), do: do_mod_pow(rem(base*base, mod), exp >>> 1, mod, result)
end


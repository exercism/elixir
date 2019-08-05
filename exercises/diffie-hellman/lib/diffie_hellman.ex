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

  A video example is available at:
  https://www.khanacademy.org/computing/computer-science/cryptography/modern-crypt/v/diffie-hellman-key-exchange-part-2
  """

  @doc """
  Given a prime integer `prime_p`, return a random integer between 1 and `prime_p` - 1
  """
  @spec generate_private_key(prime_p :: integer) :: integer
  def generate_private_key(prime_p) do
  end

  @doc """
  Given two prime integers as generators (`prime_p` and `prime_g`), and a private key,
  generate a public key using the mathematical formula:

  (prime_g **  private_key) % prime_p
  """
  @spec generate_public_key(prime_p :: integer, prime_g :: integer, private_key :: integer) ::
          integer
  def generate_public_key(prime_p, prime_g, private_key) do
  end

  @doc """
  Given a prime integer `prime_p`, user B's public key, and user A's private key,
  generate a shared secret using the mathematical formula:

  (public_key_b ** private_key_a) % prime_p
  """
  @spec generate_shared_secret(
          prime_p :: integer,
          public_key_b :: integer,
          private_key_a :: integer
        ) :: integer
  def generate_shared_secret(prime_p, public_key_b, private_key_a) do
  end
end

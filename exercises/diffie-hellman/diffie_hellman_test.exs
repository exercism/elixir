if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("diffie_hellman.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DiffieHellmanTest do
  use ExUnit.Case

  #@tag :pending
  test "private key should be between 1 and P-1, inclusive" do
    prime_p = 23

    assert DiffieHellman.generate_private_key(prime_p) in Range.new(1, prime_p-1)
  end

  @tag :pending
  test "private key generator should support very large primes" do
    prime_p = 120227323036150778550155526710966921740030662694578947298423549235265759593711587341037426347114541533006628856300552706996143592240453345642869233562886752930249953227657883929905072620233073626594386072962776144691433658814261874113232461749035425712805067202910389407991986070558964461330091797026762932543

    assert DiffieHellman.generate_private_key(prime_p) in Range.new(1, prime_p-1)
  end

  @tag :pending
  test "private keys should be random" do
    prime_p = 23

    # Due to the nature of random generators, there's a small chance it could generate
    # the same numbers over an over, so this may fail, but the RNG should be good enough
    # that 100 generated keys between 1 and 22 ought to be at least half unique.

    unique_key_count = Stream.repeatedly(fn -> DiffieHellman.generate_private_key(prime_p) end)
                       |> Enum.take(100)
                       |> Enum.uniq
                       |> length
    min_expected_unique_keys = div(prime_p, 2)

    assert unique_key_count > min_expected_unique_keys
  end

  @tag :pending
  test "public key correctly calculated from two primes and private key" do
    prime_p = 23
    prime_g = 5
    private_key = 6
    expected_public_key = 8

    assert DiffieHellman.generate_public_key(prime_p, prime_g, private_key) == expected_public_key
  end

  @tag :pending
  test "public key generator should support very large primes" do
    prime_p = 120227323036150778550155526710966921740030662694578947298423549235265759593711587341037426347114541533006628856300552706996143592240453345642869233562886752930249953227657883929905072620233073626594386072962776144691433658814261874113232461749035425712805067202910389407991986070558964461330091797026762932543
    prime_g = 75205441154357919442925546169208711235485855904969178206313309299205868312399046149367516336607966149689640419216591714331722664409474612463910928128055994157922930443733535659848264364106037925315974095321112757711756912144137705613776063541350548911512715512539186192176020596861210448363099541947258202188
    private_key = 8675309
    expected_public_key = 81945102766205597052444239927191366879878802281637258134656723311532689587789695879960502348293388789700383121890410484395608064685866057972603193444399431765316092443741213175747052166212523610645396217140238838864033970876203333493173215068467082830013531737232331628864212666452277691016389511356912249174

    assert DiffieHellman.generate_public_key(prime_p, prime_g, private_key) == expected_public_key
  end

  @tag :pending
  test "shared secret key correctly calculated from initial prime, Bob's public key, and Alice's private key" do
    prime_p = 23
    bob_public_key = 19
    alice_private_key = 6
    expected_shared_secret = 2

    assert DiffieHellman.generate_shared_secret(prime_p, bob_public_key, alice_private_key) == expected_shared_secret
  end

  @tag :pending
  test "shared secret correctly calculated when using large primes" do
    prime_p = 120227323036150778550155526710966921740030662694578947298423549235265759593711587341037426347114541533006628856300552706996143592240453345642869233562886752930249953227657883929905072620233073626594386072962776144691433658814261874113232461749035425712805067202910389407991986070558964461330091797026762932543
    bob_public_key = 75205441154357919442925546169208711235485855904969178206313309299205868312399046149367516336607966149689640419216591714331722664409474612463910928128055994157922930443733535659848264364106037925315974095321112757711756912144137705613776063541350548911512715512539186192176020596861210448363099541947258202188
    alice_private_key = 2483479393625932939911081304356888505153797135447327501792696199190469015215177630758617902200417377685436170904594686456961202706692908603181062371925882
    expected_shared_secret = 70900735223964890815905879227737819348808518698920446491346508980461201746567735331455825644429877946556431095820785835497384849778344216981228226252639932672153547963980483673419756271345828771971984887453014488572245819864454136618980914729839523581263886740821363010486083940557620831348661126601106717071

    assert DiffieHellman.generate_shared_secret(prime_p, bob_public_key, alice_private_key) == expected_shared_secret
  end

  @tag :pending
  test "exchanging public keys between Alice and Bob should calculate the same shared secret" do
    prime_p = 23
    prime_g = 5

    alice_private_key = DiffieHellman.generate_private_key(prime_p)
    bob_private_key = DiffieHellman.generate_private_key(prime_p)

    alice_public_key = DiffieHellman.generate_public_key(prime_p, prime_g, alice_private_key)
    bob_public_key = DiffieHellman.generate_public_key(prime_p, prime_g, bob_private_key)

    alice_shared_secret = DiffieHellman.generate_shared_secret(prime_p, bob_public_key, alice_private_key)
    bob_shared_secret = DiffieHellman.generate_shared_secret(prime_p, alice_public_key, bob_private_key)

    assert alice_shared_secret == bob_shared_secret
  end
end


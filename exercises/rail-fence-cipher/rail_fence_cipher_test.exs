if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("rail_fence_cipher.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule RailFenceCipherTest do
  use ExUnit.Case

  #@tag :pending
  test "test to encode with two rails" do
    assert RailFenceCipher.encode("XOXOXOXOXOXOXOXOXO", 2) == "XXXXXXXXXOOOOOOOOO"
  end

  @tag :pending
  test "test to encode with three rails" do
    msg = "WEAREDISCOVEREDFLEEATONCE"
    assert RailFenceCipher.encode(msg, 3) == "WECRLTEERDSOEEFEAOCAIVDEN"
  end 

  @tag :pending
  test "test to encode with ending in the middle" do
    assert RailFenceCipher.encode("EXERCISES", 4) == "ESXIEECSR"
  end 
  
  @tag :pending
  test "test to encode empty string" do
    assert RailFenceCipher.encode("", 4) == ""
  end

  @tag :pending
  test "test to encode a more diverse text" do
    msg = "The quick brown fox jumps over the lazy dog."
    cipher = "Tioxs aghucrwo p rtlzo.eqkbnfjmoeh yd   uve "
    assert RailFenceCipher.encode(msg, 4) == cipher
  end

  @tag :pending
  test "test to encode with one rail" do
    msg = "One rail, only one rail"
    assert RailFenceCipher.encode(msg, 1) == msg
  end

  @tag :pending
  test "test to encode letters of less than rails" do
    msg = "More rails than letters"
    assert RailFenceCipher.encode(msg, 24) == msg
  end

  @tag :pending
  test "test to decode with three rails" do
    cipher = "TEITELHDVLSNHDTISEIIEA"
    assert RailFenceCipher.decode(cipher, 3) == "THEDEVILISINTHEDETAILS"
  end

  @tag :pending
  test "test to decode with five rails" do
    cipher = "EIEXMSMESAORIWSCE"
    assert RailFenceCipher.decode(cipher, 5) == "EXERCISMISAWESOME"
  end

  @tag :pending
  test "test to decode with six rails" do
    cipher = "133714114238148966225439541018335470986172518171757571896261"
    original = "112358132134558914423337761098715972584418167651094617711286"
    assert RailFenceCipher.decode(cipher, 6) == original
  end   

  @tag :pending
  test "test to decode empty string" do
    assert RailFenceCipher.decode("", 4) == ""
  end

  @tag :pending
  test "test to decode with one rail" do
    assert RailFenceCipher.decode("ABCDEFGHIJKLMNOP", 1) == "ABCDEFGHIJKLMNOP"
  end

  @tag :pending
  test "test to decode letters of less than rails" do
    assert "More rails than letters" == RailFenceCipher.decode("More rails than letters", 24)
  end

  @tag :pending
  test "test to decode a more diverse text" do
    msg = "The quick brown fox jumps over the lazy dog."
    cipher = RailFenceCipher.encode(msg, 4)
    assert msg == RailFenceCipher.decode(cipher, 4)
  end
end

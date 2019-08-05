defmodule AtbashTest do
  use ExUnit.Case

  # @tag :pending
  test "encode no" do
    assert Atbash.encode("no") == "ml"
  end

  @tag :pending
  test "encode yes" do
    assert Atbash.encode("yes") == "bvh"
  end

  @tag :pending
  test "encode OMG" do
    assert Atbash.encode("OMG") == "lnt"
  end

  @tag :pending
  test "encode O M G" do
    assert Atbash.encode("O M G") == "lnt"
  end

  @tag :pending
  test "encode long word" do
    assert Atbash.encode("mindblowingly") == "nrmwy oldrm tob"
  end

  @tag :pending
  test "encode numbers" do
    assert Atbash.encode("Testing, 1 2 3, testing.") == "gvhgr mt123 gvhgr mt"
  end

  @tag :pending
  test "encode sentence" do
    assert Atbash.encode("Truth is fiction.") == "gifgs rhurx grlm"
  end

  @tag :pending
  test "encode all the things" do
    plaintext = "The quick brown fox jumps over the lazy dog."
    cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    assert Atbash.encode(plaintext) == cipher
  end

  @tag :pending
  test "decode exercism" do
    cipher = "vcvix rhn"
    plaintext = "exercism"
    assert Atbash.decode(cipher) == plaintext
  end

  @tag :pending
  test "decode a sentence" do
    cipher = "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
    plaintext = "anobstacleisoftenasteppingstone"
    assert Atbash.decode(cipher) == plaintext
  end

  @tag :pending
  test "decode numbers" do
    cipher = "gvhgr mt123 gvhgr mt"
    plaintext = "testing123testing"
    assert Atbash.decode(cipher) == plaintext
  end

  @tag :pending
  test "decode all the letters" do
    cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    plaintext = "thequickbrownfoxjumpsoverthelazydog"
    assert Atbash.decode(cipher) == plaintext
  end
end

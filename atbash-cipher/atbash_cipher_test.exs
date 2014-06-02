if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("atbash.exs")
end

ExUnit.start

defmodule AtbashTest do
  use ExUnit.Case, async: true

  test "encode no" do
    assert Atbash.encode("no") == "ml"
  end

  test "encode yes" do
    assert Atbash.encode("yes") == "bvh"
  end

  test "encode OMG" do
    assert Atbash.encode("OMG") == "lnt"
  end

  test "encode O M G" do
    assert Atbash.encode("O M G") == "lnt"
  end

  test "encode long word" do
    assert Atbash.encode("mindblowingly") == "nrmwy oldrm tob"
  end

  test "encode numbers" do
    assert Atbash.encode("Testing, 1 2 3, testing.") == "gvhgr mt123 gvhgr mt"
  end

  test "encode sentence" do
    assert Atbash.encode("Truth is fiction.") == "gifgs rhurx grlm"
  end

  test "encode all the things" do
    plaintext = "The quick brown fox jumps over the lazy dog."
    cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    assert Atbash.encode(plaintext) == cipher
  end
end

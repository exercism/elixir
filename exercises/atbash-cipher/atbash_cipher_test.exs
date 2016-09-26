if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("atbash.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule AtbashTest do
  use ExUnit.Case

  # @tag :skip
  test "encode no" do
    assert Atbash.encode("no") == "ml"
  end

  @tag :skip
  test "encode yes" do
    assert Atbash.encode("yes") == "bvh"
  end

  @tag :skip
  test "encode OMG" do
    assert Atbash.encode("OMG") == "lnt"
  end

  @tag :skip
  test "encode O M G" do
    assert Atbash.encode("O M G") == "lnt"
  end

  @tag :skip
  test "encode long word" do
    assert Atbash.encode("mindblowingly") == "nrmwy oldrm tob"
  end

  @tag :skip
  test "encode numbers" do
    assert Atbash.encode("Testing, 1 2 3, testing.") == "gvhgr mt123 gvhgr mt"
  end

  @tag :skip
  test "encode sentence" do
    assert Atbash.encode("Truth is fiction.") == "gifgs rhurx grlm"
  end

  @tag :skip
  test "encode all the things" do
    plaintext = "The quick brown fox jumps over the lazy dog."
    cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    assert Atbash.encode(plaintext) == cipher
  end
end

defmodule AtbashTest do
  use ExUnit.Case

  describe "encode" do
    # @tag :pending
    test "yes" do
      assert Atbash.encode("yes") == "bvh"
    end

    @tag :pending
    test "no" do
      assert Atbash.encode("no") == "ml"
    end

    @tag :pending
    test "OMG" do
      assert Atbash.encode("OMG") == "lnt"
    end

    @tag :pending
    test "O M G" do
      assert Atbash.encode("O M G") == "lnt"
    end

    @tag :pending
    test "mindblowingly" do
      assert Atbash.encode("mindblowingly") == "nrmwy oldrm tob"
    end

    @tag :pending
    test "numbers" do
      assert Atbash.encode("Testing, 1 2 3, testing.") == "gvhgr mt123 gvhgr mt"
    end

    @tag :pending
    test "deep thought" do
      assert Atbash.encode("Truth is fiction.") == "gifgs rhurx grlm"
    end

    @tag :pending
    test "all the letters" do
      plaintext = "The quick brown fox jumps over the lazy dog."
      cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
      assert Atbash.encode(plaintext) == cipher
    end
  end

  describe "decode" do
    @tag :pending
    test "exercism" do
      cipher = "vcvix rhn"
      plaintext = "exercism"
      assert Atbash.decode(cipher) == plaintext
    end

    @tag :pending
    test "a sentence" do
      cipher = "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
      plaintext = "anobstacleisoftenasteppingstone"
      assert Atbash.decode(cipher) == plaintext
    end

    @tag :pending
    test "numbers" do
      cipher = "gvhgr mt123 gvhgr mt"
      plaintext = "testing123testing"
      assert Atbash.decode(cipher) == plaintext
    end

    @tag :pending
    test "all the letters" do
      cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
      plaintext = "thequickbrownfoxjumpsoverthelazydog"
      assert Atbash.decode(cipher) == plaintext
    end

    @tag :pending
    test "with too many spaces" do
      cipher = "vc vix    r hn"
      plaintext = "exercism"
      assert Atbash.decode(cipher) == plaintext
    end

    @tag :pending
    test "with no spaces" do
      cipher = "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
      plaintext = "anobstacleisoftenasteppingstone"
      assert Atbash.decode(cipher) == plaintext
    end
  end
end

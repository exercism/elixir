if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("secret_handshake.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true, exclude: :pending

defmodule SecretHandshakeTest do
  use ExUnit.Case

  describe "Create a handshake for a number" do
    #@tag :pending
    test "wink for 1" do
      assert SecretHandshake.commands(1) == ["wink"]
    end

    @tag :pending
    test "double blink for 10" do
      assert SecretHandshake.commands(2) == ["double blink"]
    end

    @tag :pending
    test "close your eyes for 100" do
      assert SecretHandshake.commands(4) == ["close your eyes"]
    end

    @tag :pending
    test "jump for 1000" do
      assert SecretHandshake.commands(8) == ["jump"]
    end

    @tag :pending
    test "combine two actions" do
      assert SecretHandshake.commands(3) == ["wink", "double blink"]
    end

    @tag :pending
    test "reverse two actions" do
      assert SecretHandshake.commands(19) == ["double blink", "wink"]
    end

    @tag :pending
    test "reversing one action gives the same action" do
      assert SecretHandshake.commands(24) == ["jump"]
    end

    @tag :pending
    test "reversing no actions still gives no actions" do
      assert SecretHandshake.commands(16) == []
    end

    @tag :pending
    test "all possible actions" do
      assert SecretHandshake.commands(15) == ["wink", "double blink", "close your eyes", "jump"]
    end

    @tag :pending
    test "reverse all possible actions" do
      assert SecretHandshake.commands(31) == ["jump", "close your eyes", "double blink", "wink"]
    end

    @tag :pending
    test "do nothing for zero" do
      assert SecretHandshake.commands(0) == []
    end

    @tag :pending
    test "do nothing if lower 5 bits not set" do
      assert SecretHandshake.commands(32) == []
    end
  end
end

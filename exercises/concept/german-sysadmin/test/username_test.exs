defmodule UsernameTest do
  use ExUnit.Case

  describe "sanitize/1" do
    @tag task_id: 1
    test "works for an empty charlist" do
      assert Username.sanitize(~c"") == ~c""
    end

    @tag task_id: 1
    test "it allows lowercase Latin letters" do
      assert Username.sanitize(~c"anne") == ~c"anne"
    end

    @tag task_id: 1
    test "it allows the whole lowercase Latin alphabet" do
      lowercase_latin_letters = ~c"abcdefghijklmnopqrstuvwxyz"

      assert Username.sanitize(lowercase_latin_letters) == lowercase_latin_letters
    end

    @tag task_id: 1
    test "it removes numbers" do
      assert Username.sanitize(~c"schmidt1985") == ~c"schmidt"
    end

    @tag task_id: 1
    test "it removes punctuation" do
      assert Username.sanitize(~c"*fritz*!$%") == ~c"fritz"
    end

    @tag task_id: 1
    test "it removes whitespace" do
      assert Username.sanitize(~c" olaf ") == ~c"olaf"
    end

    @tag task_id: 1
    test "it removes all disallowed characters" do
      allowed_characters = ~c"abcdefghijklmnopqrstuvwxyz_ßäöü"
      input = Enum.to_list(0..0x10FFFF) -- allowed_characters

      assert Username.sanitize(input) == ~c""
    end

    @tag task_id: 2
    test "it allows underscores" do
      assert Username.sanitize(~c"marcel_huber") == ~c"marcel_huber"
    end

    @tag task_id: 3
    test "it substitutes German letters" do
      assert Username.sanitize(~c"krüger") == ~c"krueger"
      assert Username.sanitize(~c"köhler") == ~c"koehler"
      assert Username.sanitize(~c"jäger") == ~c"jaeger"
      assert Username.sanitize(~c"groß") == ~c"gross"
    end

    @tag task_id: 3
    test "it substitutes German letters and removes disallowed characters" do
      assert Username.sanitize(~c"köhler_jäger42") == ~c"koehler_jaeger"
    end
  end
end

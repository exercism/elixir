defmodule UsernameTest do
  use ExUnit.Case

  describe "sanitize/1" do
    @tag task_id: 1
    test "works for an empty charlist" do
      assert Username.sanitize('') == ''
    end

    @tag task_id: 1
    test "it allows lowercase Latin letters" do
      assert Username.sanitize('anne') == 'anne'
    end

    @tag task_id: 1
    test "it allows the whole lowercase Latin alphabet" do
      lowercase_latin_letters = 'abcdefghijklmnopqrstuvwxyz'

      assert Username.sanitize(lowercase_latin_letters) == lowercase_latin_letters
    end

    @tag task_id: 1
    test "it removes numbers" do
      assert Username.sanitize('schmidt1985') == 'schmidt'
    end

    @tag task_id: 1
    test "it removes punctuation" do
      assert Username.sanitize('*fritz*!$%') == 'fritz'
    end

    @tag task_id: 1
    test "it removes whitespace" do
      assert Username.sanitize(' olaf ') == 'olaf'
    end

    @tag task_id: 1
    test "it removes all disallowed characters" do
      allowed_characters = 'abcdefghijklmnopqrstuvwxyz_ßäöü'
      input = Enum.to_list(0..0x10FFFF) -- allowed_characters

      assert Username.sanitize(input) == ''
    end

    @tag task_id: 2
    test "it allows underscores" do
      assert Username.sanitize('marcel_huber') == 'marcel_huber'
    end

    @tag task_id: 3
    test "it substitutes German letters" do
      assert Username.sanitize('krüger') == 'krueger'
      assert Username.sanitize('köhler') == 'koehler'
      assert Username.sanitize('jäger') == 'jaeger'
      assert Username.sanitize('groß') == 'gross'
    end
  end
end

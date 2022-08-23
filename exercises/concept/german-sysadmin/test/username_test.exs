defmodule UsernameTest do
  use ExUnit.Case

  describe "sanitize/1" do
    @tag task_id: 1
    test "works for an empty charlist" do
      assert Username.sanitize('') == ''
    end

    @tag task_id: 1
    test "it removes everything but lowercase letters" do
      assert Username.sanitize('schmidt1985') == 'schmidt'
    end

    @tag task_id: 1
    test "it keeps all lowercase Latin letters (and ignores German letters that require special handling)" do
      input = Enum.to_list(0..0x10FFFF) -- [?_, ?ß, ?ä, ?ö, ?ü]
      expected = 'abcdefghijklmnopqrstuvwxyz'
      actual = Username.sanitize(input)

      assert Enum.count(actual) == Enum.count(expected)
      assert Enum.take(actual, Enum.count(expected)) == expected
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

defmodule UsernameTest do
  use ExUnit.Case

  describe "sanitize/1" do
    @tag task_id: 1
    test "works for an empty charlist" do
      assert Username.sanitize('') == ''
    end

    @tag task_id: 1
    test "it keeps lowercase latin letters" do
      input = Enum.to_list(0..0x10FFFF) -- [?_, ?ß, ?ä, ?ö, ?ü]
      expected = 'abcdefghijklmnopqrstuvwxyz'
      actual = Username.sanitize(input)

      assert Enum.take(actual, Enum.count(expected)) == expected
      assert Enum.count(actual) == Enum.count(expected)
    end

    @tag task_id: 2
    test "it keeps underscores" do
      assert Username.sanitize('marcel_huber') == 'marcel_huber'
    end

    @tag task_id: 3
    test "it substitutes german letters" do
      assert Username.sanitize('krüger') == 'krueger'
      assert Username.sanitize('köhler') == 'koehler'
      assert Username.sanitize('jäger') == 'jaeger'
      assert Username.sanitize('groß') == 'gross'
    end
  end
end

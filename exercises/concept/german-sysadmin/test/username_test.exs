defmodule UsernameTest do
  use ExUnit.Case

  describe "sanitize/1" do
    # @tag :pending
    test "works for an empty charlist" do
      assert Username.sanitize('') == ''
    end

    @tag :pending
    test "it keeps lowercase latin letters" do
      input = Enum.to_list(0..0x10FFFF) -- [?_, ?ß, ?ä, ?ö, ?ü]
      assert Username.sanitize(input) == 'abcdefghijklmnopqrstuvwxyz'
    end

    @tag :pending
    test "it keeps underscores" do
      assert Username.sanitize('marcel_huber') == 'marcel_huber'
    end

    @tag :pending
    test "it substitutes german letters" do
      assert Username.sanitize('krüger') == 'krueger'
      assert Username.sanitize('köhler') == 'koehler'
      assert Username.sanitize('jäger') == 'jaeger'
      assert Username.sanitize('groß') == 'gross'
    end
  end
end

defmodule BottleSongTest do
  use ExUnit.Case

  describe "[Single verse]" do
    # @tag :pending
    test "First generic verse" do
      assert BottleSong.recite(10, 1) ==
               """
               Ten green bottles hanging on the wall,
               Ten green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be nine green bottles hanging on the wall.\
               """
    end

    @tag :pending
    test "Last generic verse" do
      assert BottleSong.recite(3, 1) ==
               """
               Three green bottles hanging on the wall,
               Three green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be two green bottles hanging on the wall.\
               """
    end

    @tag :pending
    test "Verse with 2 bottles" do
      assert BottleSong.recite(2, 1) ==
               """
               Two green bottles hanging on the wall,
               Two green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be one green bottle hanging on the wall.\
               """
    end

    @tag :pending
    test "Verse with 1 bottle" do
      assert BottleSong.recite(1, 1) ==
               """
               One green bottle hanging on the wall,
               One green bottle hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be no green bottles hanging on the wall.\
               """
    end
  end

  describe "[Multiple verses]" do
    @tag :pending
    test "First two verses" do
      assert BottleSong.recite(10, 2) ==
               """
               Ten green bottles hanging on the wall,
               Ten green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be nine green bottles hanging on the wall.

               Nine green bottles hanging on the wall,
               Nine green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be eight green bottles hanging on the wall.\
               """
    end

    @tag :pending
    test "Last three verses" do
      assert BottleSong.recite(3, 3) ==
               """
               Three green bottles hanging on the wall,
               Three green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be two green bottles hanging on the wall.

               Two green bottles hanging on the wall,
               Two green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be one green bottle hanging on the wall.

               One green bottle hanging on the wall,
               One green bottle hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be no green bottles hanging on the wall.\
               """
    end

    @tag :pending
    test "All verses" do
      assert BottleSong.recite(10, 10) ==
               """
               Ten green bottles hanging on the wall,
               Ten green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be nine green bottles hanging on the wall.

               Nine green bottles hanging on the wall,
               Nine green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be eight green bottles hanging on the wall.

               Eight green bottles hanging on the wall,
               Eight green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be seven green bottles hanging on the wall.

               Seven green bottles hanging on the wall,
               Seven green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be six green bottles hanging on the wall.

               Six green bottles hanging on the wall,
               Six green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be five green bottles hanging on the wall.

               Five green bottles hanging on the wall,
               Five green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be four green bottles hanging on the wall.

               Four green bottles hanging on the wall,
               Four green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be three green bottles hanging on the wall.

               Three green bottles hanging on the wall,
               Three green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be two green bottles hanging on the wall.

               Two green bottles hanging on the wall,
               Two green bottles hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be one green bottle hanging on the wall.

               One green bottle hanging on the wall,
               One green bottle hanging on the wall,
               And if one green bottle should accidentally fall,
               There'll be no green bottles hanging on the wall.\
               """
    end
  end
end

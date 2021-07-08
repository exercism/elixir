defmodule HighSchoolSweetheartTest do
  use ExUnit.Case

  describe "first_letter/1" do
    @tag task_id: 1
    test "it gets the first letter" do
      assert HighSchoolSweetheart.first_letter("Mary") == "M"
    end

    @tag task_id: 1
    test "it doesn't change the letter's case" do
      assert HighSchoolSweetheart.first_letter("john") == "j"
    end

    @tag task_id: 1
    test "it strips extra whitespace" do
      assert HighSchoolSweetheart.first_letter("\n\t   Sarah   ") == "S"
    end
  end

  describe "initial/1" do
    @tag task_id: 2
    test "it gets the first letter and appends a dot" do
      assert HighSchoolSweetheart.initial("Betty") == "B."
    end

    @tag task_id: 2
    test "it uppercases the first letter" do
      assert HighSchoolSweetheart.initial("james") == "J."
    end
  end

  describe "initials/1" do
    @tag task_id: 3
    test "returns the initials for the first name and the last name" do
      assert HighSchoolSweetheart.initials("Linda Miller") == "L. M."
    end
  end

  describe "pair/2" do
    @tag task_id: 4
    test "prints the pair's initials inside a heart" do
      assert HighSchoolSweetheart.pair("Avery Bryant", "Charlie Dixon") ==
               """
                    ******       ******
                  **      **   **      **
                **         ** **         **
               **            *            **
               **                         **
               **     A. B.  +  C. D.     **
                **                       **
                  **                   **
                    **               **
                      **           **
                        **       **
                          **   **
                            ***
                             *
               """
    end
  end
end

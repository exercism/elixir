defmodule AllergiesTest do
  use ExUnit.Case

  defp assert_is_a_set_containing(list, to_contain) do
    set = Enum.into(list, MapSet.new())

    same_contents =
      to_contain
      |> Enum.into(MapSet.new())
      |> MapSet.equal?(set)

    assert same_contents,
           "Expected a set with: #{inspect(to_contain)} got #{inspect(set |> MapSet.to_list())}"
  end

  describe "allergy list against expected allergens -" do
    # @tag :pending
    test "no allergies at all" do
      Allergies.list(0) |> assert_is_a_set_containing([])
    end

    @tag :pending
    test "allergic to just eggs" do
      Allergies.list(1) |> assert_is_a_set_containing(~w[eggs])
    end

    @tag :pending
    test "allergic to just peanuts" do
      Allergies.list(2) |> assert_is_a_set_containing(~w[peanuts])
    end

    @tag :pending
    test "allergic to just strawberries" do
      Allergies.list(8) |> assert_is_a_set_containing(~w[strawberries])
    end

    @tag :pending
    test "allergic to eggs and peanuts" do
      Allergies.list(3) |> assert_is_a_set_containing(~w[eggs peanuts])
    end

    @tag :pending
    test "allergic to more than eggs but not peanuts" do
      Allergies.list(5) |> assert_is_a_set_containing(~w[eggs shellfish])
    end

    @tag :pending
    test "allergic to lots of stuff" do
      Allergies.list(248)
      |> assert_is_a_set_containing(~w[strawberries tomatoes chocolate pollen cats])
    end

    @tag :pending
    test "allergic to everything" do
      Allergies.list(255)
      |> assert_is_a_set_containing(
        ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
      )
    end

    @tag :pending
    test "ignore non allergen score parts" do
      Allergies.list(509)
      |> assert_is_a_set_containing(
        ~w[eggs shellfish strawberries tomatoes chocolate pollen cats]
      )
    end

    @tag :pending
    test "ignore non allergen score parts without highest valid score" do
      Allergies.list(257)
      |> assert_is_a_set_containing(~w[eggs])
    end
  end

  describe "score for egg allergies -" do
    @tag :pending
    test "not allergic to eggs" do
      refute Allergies.allergic_to?(0, "eggs")
    end

    @tag :pending
    test "is allergic to only eggs" do
      assert Allergies.allergic_to?(1, "eggs")
    end

    @tag :pending
    test "is allergic to eggs and something else" do
      assert Allergies.allergic_to?(3, "eggs")
    end

    @tag :pending
    test "is allergic to something, but not eggs" do
      refute Allergies.allergic_to?(2, "eggs")
    end

    @tag :pending
    test "is allergic to everything (including eggs)" do
      assert Allergies.allergic_to?(255, "eggs")
    end
  end

  describe "score for peanuts allergies -" do
    @tag :pending
    test "not allergic to peanuts" do
      refute Allergies.allergic_to?(0, "peanuts")
    end

    @tag :pending
    test "is allergic to only peanuts" do
      assert Allergies.allergic_to?(2, "peanuts")
    end

    @tag :pending
    test "is allergic to peanuts and something else" do
      assert Allergies.allergic_to?(7, "peanuts")
    end

    @tag :pending
    test "is allergic to something, but not peanuts" do
      refute Allergies.allergic_to?(5, "peanuts")
    end

    @tag :pending
    test "is allergic to everything (including peanuts)" do
      assert Allergies.allergic_to?(255, "peanuts")
    end
  end

  describe "score for shellfish allergies -" do
    @tag :pending
    test "not allergic to shellfish" do
      refute Allergies.allergic_to?(0, "shellfish")
    end

    @tag :pending
    test "is allergic to only shellfish" do
      assert Allergies.allergic_to?(4, "shellfish")
    end

    @tag :pending
    test "is allergic to shellfish and something else" do
      assert Allergies.allergic_to?(14, "shellfish")
    end

    @tag :pending
    test "is allergic to something, but not shellfish" do
      refute Allergies.allergic_to?(10, "shellfish")
    end

    @tag :pending
    test "is allergic to everything (including shellfish)" do
      assert Allergies.allergic_to?(255, "shellfish")
    end
  end

  describe "score for strawberries allergies -" do
    @tag :pending
    test "not allergic to strawberries" do
      refute Allergies.allergic_to?(0, "strawberries")
    end

    @tag :pending
    test "is allergic to only strawberries" do
      assert Allergies.allergic_to?(8, "strawberries")
    end

    @tag :pending
    test "is allergic to strawberries and something else" do
      assert Allergies.allergic_to?(28, "strawberries")
    end

    @tag :pending
    test "is allergic to something, but not strawberries" do
      refute Allergies.allergic_to?(20, "strawberries")
    end

    @tag :pending
    test "is allergic to everything (including strawberries)" do
      assert Allergies.allergic_to?(255, "strawberries")
    end
  end

  describe "score for tomatoes allergies -" do
    @tag :pending
    test "not allergic to tomatoes" do
      refute Allergies.allergic_to?(0, "tomatoes")
    end

    @tag :pending
    test "is allergic to only tomatoes" do
      assert Allergies.allergic_to?(16, "tomatoes")
    end

    @tag :pending
    test "is allergic to tomatoes and something else" do
      assert Allergies.allergic_to?(56, "tomatoes")
    end

    @tag :pending
    test "is allergic to something, but not tomatoes" do
      refute Allergies.allergic_to?(40, "tomatoes")
    end

    @tag :pending
    test "is allergic to everything (including tomatoes)" do
      assert Allergies.allergic_to?(255, "tomatoes")
    end
  end

  describe "score for chocolate allergies -" do
    @tag :pending
    test "not allergic to chocolate" do
      refute Allergies.allergic_to?(0, "chocolate")
    end

    @tag :pending
    test "is allergic to only chocolate" do
      assert Allergies.allergic_to?(32, "chocolate")
    end

    @tag :pending
    test "is allergic to chocolate and something else" do
      assert Allergies.allergic_to?(112, "chocolate")
    end

    @tag :pending
    test "is allergic to something, but not chocolate" do
      refute Allergies.allergic_to?(80, "chocolate")
    end

    @tag :pending
    test "is allergic to everything (including chocolate)" do
      assert Allergies.allergic_to?(255, "chocolate")
    end
  end

  describe "score for pollen allergies -" do
    @tag :pending
    test "not allergic to pollen" do
      refute Allergies.allergic_to?(0, "pollen")
    end

    @tag :pending
    test "is allergic to only pollen" do
      assert Allergies.allergic_to?(64, "pollen")
    end

    @tag :pending
    test "is allergic to pollen and something else" do
      assert Allergies.allergic_to?(224, "pollen")
    end

    @tag :pending
    test "is allergic to something, but not pollen" do
      refute Allergies.allergic_to?(160, "pollen")
    end

    @tag :pending
    test "is allergic to everything (including pollen)" do
      assert Allergies.allergic_to?(255, "pollen")
    end
  end

  describe "score for cats allergies -" do
    @tag :pending
    test "not allergic to cats" do
      refute Allergies.allergic_to?(0, "cats")
    end

    @tag :pending
    test "is allergic to only cats" do
      assert Allergies.allergic_to?(128, "cats")
    end

    @tag :pending
    test "is allergic to cats and something else" do
      assert Allergies.allergic_to?(192, "cats")
    end

    @tag :pending
    test "is allergic to something, but not cats" do
      refute Allergies.allergic_to?(64, "cats")
    end

    @tag :pending
    test "is allergic to everything (including cats)" do
      assert Allergies.allergic_to?(255, "cats")
    end
  end
end

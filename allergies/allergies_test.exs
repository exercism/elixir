if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("allergies.exs")
end


ExUnit.start

defmodule AllergiesTest do
  use ExUnit.Case, async: true

  test "no_allergies_at_all" do
    assert Allergies.list(0) == []
  end

  test "allergic_to_just_eggs" do
    assert Allergies.list(1) == ["eggs"]
  end

  test "allergic_to_just_peanuts" do
    assert Allergies.list(2) == ["peanuts"]
  end

  test "allergic_to_just_strawberries" do
    assert Allergies.list(8) == ["strawberries"]
  end

  test "allergic_to_eggs_and_peanuts" do
    assert Allergies.list(3) == ["eggs", "peanuts"]
  end

  test "allergic_to_more_than_eggs_but_not_peanuts" do
    assert Allergies.list(5) == ["eggs", "shellfish"]
  end

  test "allergic_to_lots_of_stuff" do
    assert Allergies.list(248) == ["strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  end

  test "allergic_to_everything" do
    assert Allergies.list(255) == ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  end

  test "no_allergies_means_not_allergic" do
    assert ! Allergies.allergic_to?(0, "peanuts")
    assert ! Allergies.allergic_to?(0, "cats")
    assert ! Allergies.allergic_to?(0, "strawberries")
  end

  test "is_allergic_to_eggs" do
    assert Allergies.allergic_to?(1, "eggs")
  end

  test "allergic_to_eggs_in_addition_to_other_stuff" do
    assert Allergies.allergic_to?(5, "eggs")
  end

  test "ignore_non_allergen_score_parts" do
    assert Allergies.list(509) == ["eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  end
end

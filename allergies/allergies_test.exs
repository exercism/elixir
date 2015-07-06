if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("allergies.exs")
end


ExUnit.start

defmodule AllergiesTest do
  use ExUnit.Case, async: true

  test "no_allergies_at_all" do
    Allergies.list(0) |> assert_is_a_set_containing []
  end

  test "allergic_to_just_eggs" do
    Allergies.list(1) |> assert_is_a_set_containing ["eggs"]
  end

  test "allergic_to_just_peanuts" do
    Allergies.list(2) |> assert_is_a_set_containing ["peanuts"]
  end

  test "allergic_to_just_strawberries" do
    Allergies.list(8) |> assert_is_a_set_containing ["strawberries"]
  end

  test "allergic_to_eggs_and_peanuts" do
    Allergies.list(3) |> assert_is_a_set_containing ["eggs", "peanuts"]
  end

  test "allergic_to_more_than_eggs_but_not_peanuts" do
    Allergies.list(5) |> assert_is_a_set_containing ["eggs", "shellfish"]
  end

  test "allergic_to_lots_of_stuff" do
    Allergies.list(248) |> assert_is_a_set_containing ["strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  end

  test "allergic_to_everything" do
    Allergies.list(255) |> assert_is_a_set_containing ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
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
    Allergies.list(509) |> assert_is_a_set_containing ["eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  end

  defp assert_is_a_set_containing(set, to_contain) do
    same_contents = to_contain
      |> Enum.into(HashSet.new)
      |> Set.equal?(set)
    assert same_contents,
           "Expected a set with: #{inspect to_contain} got #{inspect set |> Set.to_list}"
  end

end

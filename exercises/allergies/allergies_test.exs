if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("allergies.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule AllergiesTest do
  use ExUnit.Case

  # @tag :pending
  test "no_allergies_at_all" do
    Allergies.list(0) |> assert_is_a_set_containing([])
  end

  @tag :pending
  test "allergic_to_just_eggs" do
    Allergies.list(1) |> assert_is_a_set_containing(~w[eggs])
  end

  @tag :pending
  test "allergic_to_just_peanuts" do
    Allergies.list(2) |> assert_is_a_set_containing(~w[peanuts])
  end

  @tag :pending
  test "allergic_to_just_strawberries" do
    Allergies.list(8) |> assert_is_a_set_containing(~w[strawberries])
  end

  @tag :pending
  test "allergic_to_eggs_and_peanuts" do
    Allergies.list(3) |> assert_is_a_set_containing(~w[eggs peanuts])
  end

  @tag :pending
  test "allergic_to_more_than_eggs_but_not_peanuts" do
    Allergies.list(5) |> assert_is_a_set_containing(~w[eggs shellfish])
  end

  @tag :pending
  test "allergic_to_lots_of_stuff" do
    Allergies.list(248)
    |> assert_is_a_set_containing(~w[strawberries tomatoes chocolate pollen cats])
  end

  @tag :pending
  test "allergic_to_everything" do
    Allergies.list(255)
    |> assert_is_a_set_containing(
      ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
    )
  end

  @tag :pending
  test "no_allergies_means_not_allergic" do
    refute Allergies.allergic_to?(0, "peanuts")
    refute Allergies.allergic_to?(0, "cats")
    refute Allergies.allergic_to?(0, "strawberries")
  end

  @tag :pending
  test "is_allergic_to_eggs" do
    assert Allergies.allergic_to?(1, "eggs")
  end

  @tag :pending
  test "allergic_to_eggs_in_addition_to_other_stuff" do
    assert Allergies.allergic_to?(5, "eggs")
  end

  @tag :pending
  test "ignore_non_allergen_score_parts" do
    Allergies.list(509)
    |> assert_is_a_set_containing(~w[eggs shellfish strawberries tomatoes chocolate pollen cats])
  end

  defp assert_is_a_set_containing(list, to_contain) do
    set = Enum.into(list, MapSet.new())

    same_contents =
      to_contain
      |> Enum.into(MapSet.new())
      |> MapSet.equal?(set)

    assert same_contents,
           "Expected a set with: #{inspect(to_contain)} got #{inspect(set |> MapSet.to_list())}"
  end
end

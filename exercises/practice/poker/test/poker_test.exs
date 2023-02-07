defmodule PokerTest do
  use ExUnit.Case

  defp assert_poker(winning_hands, expected_winning_hands) do
    winning_hands =
      if is_list(winning_hands) do
        winning_hands
        |> Enum.map(&Enum.sort/1)
        |> Enum.sort()
      else
        winning_hands
      end

    expected_winning_hands =
      if is_list(expected_winning_hands) do
        expected_winning_hands
        |> Enum.map(&Enum.sort/1)
        |> Enum.sort()
      else
        expected_winning_hands
      end

    assert winning_hands == expected_winning_hands
  end

  # @tag :pending
  test "single hand always wins" do
    high_of_jack = ~w(4S 5S 7H 8D JC)
    winning_hands = Poker.best_hand([high_of_jack])
    assert_poker(winning_hands, [high_of_jack])
  end

  @tag :pending
  test "highest card out of all hands wins" do
    high_of_8 = ~w(4D 5S 6S 8D 3C)
    high_of_10 = ~w(2S 4C 7S 9H 10H)
    high_of_jack = ~w(3S 4S 5D 6H JH)
    winning_hands = Poker.best_hand([high_of_8, high_of_10, high_of_jack])
    assert_poker(winning_hands, [high_of_jack])
  end

  @tag :pending
  test "a tie has multiple winners" do
    high_of_8 = ~w(4D 5S 6S 8D 3C)
    high_of_10 = ~w(2S 4C 7S 9H 10H)
    high_of_jack = ~w(3S 4S 5D 6H JH)
    another_high_of_jack = ~w(3H 4H 5C 6C JD)

    hands = [high_of_8, high_of_10, high_of_jack, another_high_of_jack]
    winning_hands = Poker.best_hand(hands)
    assert_poker(winning_hands, [high_of_jack, another_high_of_jack])
  end

  @tag :pending
  test "multiple hands with the same high cards, tie compares next highest ranked, down to last card" do
    high_of_8_low_of_3 = ~w(3S 5H 6S 8D 7H)
    high_of_8_low_of_2 = ~w(2S 5D 6D 8C 7S)
    winning_hands = Poker.best_hand([high_of_8_low_of_3, high_of_8_low_of_2])
    assert_poker(winning_hands, [high_of_8_low_of_3])
  end

  @tag :pending
  test "one pair beats high card" do
    high_of_king = ~w(4S 5H 6C 8D KH)
    pair_of_4 = ~w(2S 4H 6S 4D JH)
    winning_hands = Poker.best_hand([high_of_king, pair_of_4])
    assert_poker(winning_hands, [pair_of_4])
  end

  @tag :pending
  test "highest pair wins" do
    pair_of_2 = ~w(4S 2H 6S 2D JH)
    pair_of_4 = ~w(2S 4H 6C 4D JD)
    winning_hands = Poker.best_hand([pair_of_2, pair_of_4])
    assert_poker(winning_hands, [pair_of_4])
  end

  @tag :pending
  test "two pairs beats one pair" do
    pair_of_8 = ~w(2S 8H 6S 8D JH)
    fives_and_fours = ~w(4S 5H 4C 8C 5C)
    winning_hands = Poker.best_hand([pair_of_8, fives_and_fours])
    assert_poker(winning_hands, [fives_and_fours])
  end

  @tag :pending
  test "both hands have two pairs, highest ranked pair wins" do
    eights_and_twos = ~w(2S 8H 2D 8D 3H)
    fives_and_fours = ~w(4S 5H 4C 8S 5D)
    winning_hands = Poker.best_hand([eights_and_twos, fives_and_fours])
    assert_poker(winning_hands, [eights_and_twos])
  end

  @tag :pending
  test "both hands have two pairs, with the same highest ranked pair, tie goes to low pair" do
    queens_and_twos = ~w(2S QS 2C QD JH)
    queens_and_jacks = ~w(JD QH JS 8D QC)
    winning_hands = Poker.best_hand([queens_and_twos, queens_and_jacks])
    assert_poker(winning_hands, [queens_and_jacks])
  end

  @tag :pending
  test "both hands have two identically ranked pairs, tie goes to remaining card (kicker)" do
    queens_jacks_and_8 = ~w(JD QH JS 8D QC)
    queens_jacks_and_2 = ~w(JS QS JC 2D QD)
    winning_hands = Poker.best_hand([queens_jacks_and_8, queens_jacks_and_2])
    assert_poker(winning_hands, [queens_jacks_and_8])
  end

  @tag :pending
  test "both hands have two pairs that add to the same value, win goes to highest pair" do
    sixes_threes_and_ace = ~w(6S 6H 3S 3H AS)
    sevens_twos_and_ace = ~w(7H 7S 2H 2S AC)
    winning_hands = Poker.best_hand([sixes_threes_and_ace, sevens_twos_and_ace])
    assert_poker(winning_hands, [sevens_twos_and_ace])
  end

  @tag :pending
  test "two pairs first ranked by largest pair" do
    fives_fours_and_two = ~w(5C 2S 5S 4H 4C)
    sixes_twos_and_seven = ~w(6S 2S 6H 7C 2C)
    winning_hands = Poker.best_hand([fives_fours_and_two, sixes_twos_and_seven])
    assert_poker(winning_hands, [sixes_twos_and_seven])
  end

  @tag :pending
  test "three of a kind beats two pair" do
    eights_and_twos = ~w(2S 8H 2H 8D JH)
    three_fours = ~w(4S 5H 4C 8S 4H)
    winning_hands = Poker.best_hand([eights_and_twos, three_fours])
    assert_poker(winning_hands, [three_fours])
  end

  @tag :pending
  test "both hands have three of a kind, tie goes to highest ranked triplet" do
    three_twos = ~w(2S 2H 2C 8D JH)
    three_aces = ~w(4S AH AS 8C AD)
    winning_hands = Poker.best_hand([three_twos, three_aces])
    assert_poker(winning_hands, [three_aces])
  end

  @tag :pending
  test "with multiple decks, two players can have same three of a kind, ties go to highest remaining cards" do
    three_aces_7_high = ~w(4S AH AS 7C AD)
    three_aces_8_high = ~w(4S AH AS 8C AD)
    winning_hands = Poker.best_hand([three_aces_7_high, three_aces_8_high])
    assert_poker(winning_hands, [three_aces_8_high])

    three_aces_8_high_5_low = ~w(5S AH AS 8C AD)
    winning_hands = Poker.best_hand([three_aces_8_high_5_low, three_aces_8_high])
    assert_poker(winning_hands, [three_aces_8_high_5_low])
  end

  @tag :pending
  test "a straight beats three of a kind" do
    three_fours = ~w(4S 5H 4C 8D 4H)
    straight = ~w(3S 4D 2S 6D 5C)
    winning_hands = Poker.best_hand([three_fours, straight])
    assert_poker(winning_hands, [straight])
  end

  @tag :pending
  test "aces can end a straight (10 J Q K A)" do
    three_fours = ~w(4S 5H 4C 8D 4H)
    straight_to_ace = ~w(10D JH QS KD AC)
    winning_hands = Poker.best_hand([three_fours, straight_to_ace])
    assert_poker(winning_hands, [straight_to_ace])
  end

  @tag :pending
  test "aces can start a straight (A 2 3 4 5)" do
    three_fours = ~w(4S 5H 4C 8D 4H)
    straight_to_5 = ~w(4D AH 3S 2D 5C)
    winning_hands = Poker.best_hand([three_fours, straight_to_5])
    assert_poker(winning_hands, [straight_to_5])
  end

  @tag :pending
  test "aces cannot be in the middle of a straight (Q K A 2 3)" do
    pair = ~w(2C 3D 7H 5H 2S)
    not_a_straight = ~w(QS KH AC 2D 3S)
    winning_hands = Poker.best_hand([pair, not_a_straight])
    assert_poker(winning_hands, [pair])
  end

  @tag :pending
  test "both hands with a straight, tie goes to highest ranked card" do
    straight_to_8 = ~w(4S 6C 7S 8D 5H)
    straight_to_9 = ~w(5S 7H 8S 9D 6H)
    winning_hands = Poker.best_hand([straight_to_8, straight_to_9])
    assert_poker(winning_hands, [straight_to_9])
  end

  @tag :pending
  test "even though an ace is usually high, a 5-high straight is the lowest-scoring straight" do
    straight_to_6 = ~w(2H 3C 4D 5D 6H)
    straight_to_5 = ~w(4S AH 3S 2D 5H)
    winning_hands = Poker.best_hand([straight_to_6, straight_to_5])
    assert_poker(winning_hands, [straight_to_6])
  end

  @tag :pending
  test "flush beats a straight" do
    straight_to_8 = ~w(4C 6H 7D 8D 5H)
    flush_to_7 = ~w(2S 4S 5S 6S 7S)
    winning_hands = Poker.best_hand([straight_to_8, flush_to_7])
    assert_poker(winning_hands, [flush_to_7])
  end

  @tag :pending
  test "both hands have a flush, tie goes to high card, down to the last one if necessary" do
    flush_to_9 = ~w(4H 7H 8H 9H 6H)
    flush_to_7 = ~w(2S 4S 5S 6S 7S)
    winning_hands = Poker.best_hand([flush_to_9, flush_to_7])
    assert_poker(winning_hands, [flush_to_9])

    flush_to_9_with_4_matches = ~w(3S 6S 7S 8S 9S)
    winning_hands = Poker.best_hand([flush_to_9, flush_to_9_with_4_matches])
    assert_poker(winning_hands, [flush_to_9])
  end

  @tag :pending
  test "full house beats a flush" do
    flush_to_8 = ~w(3H 6H 7H 8H 5H)
    full = ~w(4S 5H 4C 5D 4H)
    winning_hands = Poker.best_hand([flush_to_8, full])
    assert_poker(winning_hands, [full])
  end

  @tag :pending
  test "both hands have a full house, tie goes to highest-ranked triplet" do
    full_of_4_by_9 = ~w(4H 4S 4D 9S 9D)
    full_of_5_by_8 = ~w(5H 5S 5D 8S 8D)
    winning_hands = Poker.best_hand([full_of_4_by_9, full_of_5_by_8])
    assert_poker(winning_hands, [full_of_5_by_8])
  end

  @tag :pending
  test "with multiple decks, both hands have a full house with the same triplet, tie goes to the pair" do
    full_of_5_by_9 = ~w(5H 5S 5D 9S 9D)
    full_of_5_by_8 = ~w(5H 5S 5D 8S 8D)
    winning_hands = Poker.best_hand([full_of_5_by_9, full_of_5_by_8])
    assert_poker(winning_hands, [full_of_5_by_9])
  end

  @tag :pending
  test "four of a kind beats a full house" do
    full = ~w(4S 5H 4D 5D 4H)
    four_3s = ~w(3S 3H 2S 3D 3C)
    winning_hands = Poker.best_hand([four_3s, full])
    assert_poker(winning_hands, [four_3s])
  end

  @tag :pending
  test "both hands have four of a kind, tie goes to high quad" do
    four_2s = ~w(2S 2H 2C 8D 2D)
    four_5s = ~w(4S 5H 5S 5D 5C)
    winning_hands = Poker.best_hand([four_2s, four_5s])
    assert_poker(winning_hands, [four_5s])
  end

  @tag :pending
  test "with multiple decks, both hands with identical four of a kind, tie determined by kicker" do
    four_3s_and_2 = ~w(3S 3H 2S 3D 3C)
    four_3s_and_4 = ~w(3S 3H 4S 3D 3C)
    winning_hands = Poker.best_hand([four_3s_and_2, four_3s_and_4])
    assert_poker(winning_hands, [four_3s_and_4])
  end

  @tag :pending
  test "straight flush beats four of a kind" do
    four_5s = ~w(4S 5H 5S 5D 5C)
    straight_flush_to_10 = ~w(7S 8S 9S 6S 10S)
    winning_hands = Poker.best_hand([four_5s, straight_flush_to_10])
    assert_poker(winning_hands, [straight_flush_to_10])
  end

  @tag :pending
  test "aces can end a straight flush (10 J Q K A)" do
    four_aces = ~w(KC AH AS AD AC)
    straight_flush_to_ace = ~w(10C JC QC KC AC)
    winning_hands = Poker.best_hand([four_aces, straight_flush_to_ace])
    assert_poker(winning_hands, [straight_flush_to_ace])
  end

  @tag :pending
  test "aces can start a straight flush (A 2 3 4 5)" do
    four_aces = ~w(KS AH AS AD AC)
    straight_flush_to_5 = ~w(4H AH 3H 2H 5H)
    winning_hands = Poker.best_hand([four_aces, straight_flush_to_5])
    assert_poker(winning_hands, [straight_flush_to_5])
  end

  @tag :pending
  test "aces cannot be in the middle of a straight flush (Q K A 2 3)" do
    nothing = ~w(2C AC QC 10C KC)
    not_a_straight_flush = ~w(QH KH AH 2H 3H)
    winning_hands = Poker.best_hand([nothing, not_a_straight_flush])
    assert_poker(winning_hands, [nothing])
  end

  @tag :pending
  test "both hands have a straight flush, tie goes to highest-ranked card" do
    straight_flush_to_8 = ~w(4H 6H 7H 8H 5H)
    straight_flush_to_9 = ~w(5S 7S 8S 9S 6S)
    winning_hands = Poker.best_hand([straight_flush_to_8, straight_flush_to_9])
    assert_poker(winning_hands, [straight_flush_to_9])
  end

  @tag :pending
  test "even though an ace is usually high, a 5-high straight flush is the lowest-scoring straight flush" do
    straight_flush_to_6 = ~w(2H 3H 4H 5H 6H)
    straight_flush_to_5 = ~w(4D AD 3D 2D 5D)
    winning_hands = Poker.best_hand([straight_flush_to_6, straight_flush_to_5])
    assert_poker(winning_hands, [straight_flush_to_6])
  end
end

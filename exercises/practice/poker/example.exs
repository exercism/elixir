defmodule Poker do
  @doc """
  Given a list of poker hands, return a list containing the highest scoring hand.

  If two or more hands tie, return the list of tied hands in the order they were received.

  The basic rules and hand rankings for Poker can be found at:

  https://en.wikipedia.org/wiki/List_of_poker_hands

  For this exercise, we'll consider the game to be using no Jokers,
  so five-of-a-kind hands will not be tested. We will also consider
  the game to be using multiple decks, so it is possible for multiple
  players to have identical cards.

  Aces can be used in low (A 2 3 4 5) or high (10 J Q K A) straights, but do not count as
  a high card in the former case.

  For example, (A 2 3 4 5) will lose to (2 3 4 5 6).

  You can also assume all inputs will be valid, and do not need to perform error checking
  when parsing card values. All hands will be a list of 5 strings, containing a number
  (or letter) for the rank, followed by the suit.

  Ranks (lowest to highest): 2 3 4 5 6 7 8 9 10 J Q K A
  Suits (order doesn't matter): C D H S

  Example hand: ~w(4S 5H 4C 5D 4H) # Full house, 5s over 4s
  """
  @spec best_hand(list(list(String.t()))) :: list(list(String.t()))
  def best_hand(hands) do
    sorted_hands =
      hands
      |> Enum.map(&score_hand/1)
      |> Enum.sort(&sort_scored_hands/2)

    [{_, highest_score, highest_extra} | _] = sorted_hands

    highest_args = {highest_score, highest_extra}

    sorted_hands
    |> Enum.group_by(fn {_hand, score, extra} -> {score, extra} end)
    |> Map.get(highest_args)
    |> Enum.map(fn {hand, _score, _extra} -> hand end)
  end

  @ranks ~w(2 3 4 5 6 7 8 9 10 J Q K A)
  @suits ~w(clubs diamonds hearts spades)a
  @scores ~w(straight_flush four_of_a_kind full_house flush straight three_of_a_kind two_pair pair high_card)a

  for {rank, value} <- Enum.with_index(@ranks, 2),
      suit <- @suits do
    suit_char = suit |> to_string |> String.upcase() |> String.first()

    defp card(<<unquote(rank), unquote(suit_char)>>), do: {unquote(value), unquote(suit)}
  end

  defp score_hand(hand) do
    {ranks, suits} =
      hand
      |> Enum.map(&card/1)
      |> Enum.sort(&sort_rank_asc/2)
      |> Enum.unzip()

    flush = suits |> Enum.uniq() |> length |> Kernel.==(1)

    ranks
    |> Enum.group_by(fn x -> x end)
    |> Enum.into(%{}, fn {k, v} -> {k, length(v)} end)
    |> Enum.sort(&sort_count_then_rank_asc/2)
    |> score_hand(ranks, flush)
    |> Tuple.insert_at(0, hand)
  end

  defp score_hand(_, [2, 3, 4, 5, 14], true), do: {:straight_flush, {5}}
  defp score_hand(_, [2, 3, 4, 5, 14], _), do: {:straight, {5}}

  defp score_hand(counts, [low, _, _, _, high], true)
       when length(counts) == 5 and high - low == 4,
       do: {:straight_flush, {high}}

  defp score_hand(counts, [low, _, _, _, high], _) when length(counts) == 5 and high - low == 4,
    do: {:straight, {high}}

  defp score_hand(_, ranks, true), do: {:flush, {ranks |> Enum.sort() |> Enum.reverse()}}
  defp score_hand([{kicker, 1}, {high, 4}], _, _), do: {:four_of_a_kind, {high, kicker}}
  defp score_hand([{pair, 2}, {triplet, 3}], _, _), do: {:full_house, {triplet, pair}}

  defp score_hand([{kicker1, 1}, {kicker2, 1}, {triplet, 3}], _, _),
    do: {:three_of_a_kind, {triplet, [kicker1, kicker2] |> Enum.sort() |> Enum.reverse()}}

  defp score_hand([{kicker, 1}, {low_pair, 2}, {high_pair, 2}], _, _),
    do: {:two_pair, {high_pair, low_pair, kicker}}

  defp score_hand([{kicker1, 1}, {kicker2, 1}, {kicker3, 1}, {pair, 2}], _, _),
    do: {:pair, {pair, [kicker1, kicker2, kicker3] |> Enum.sort() |> Enum.reverse()}}

  defp score_hand(_, ranks, _), do: {:high_card, {ranks |> Enum.sort() |> Enum.reverse()}}

  defp sort_rank_asc({rank1, _}, {rank2, _}), do: rank1 <= rank2

  defp sort_count_then_rank_asc({rank1, count1}, {rank2, count2}),
    do: count1 <= count2 and rank1 <= rank2

  # Compare different scores against each other first
  for {score, index} <- @scores |> Enum.with_index(1) do
    for other_score <- @scores |> Enum.drop(index) do
      defp sort_scored_hands({_, unquote(score), _}, {_, unquote(other_score), _}), do: true
      defp sort_scored_hands({_, unquote(other_score), _}, {_, unquote(score), _}), do: false
    end
  end

  # Additional rules for tiebreakers

  # Straight flush tie determined by high card
  defp sort_scored_hands({_, :straight_flush, {high_a}}, {_, :straight_flush, {high_b}}),
    do: high_a >= high_b

  # 4-of-a-kind tie determined by rank, then by kicker
  defp sort_scored_hands({_, :four_of_a_kind, {rank_a, _}}, {_, :four_of_a_kind, {rank_b, _}})
       when rank_a > rank_b,
       do: true

  defp sort_scored_hands({_, :four_of_a_kind, {rank_a, _}}, {_, :four_of_a_kind, {rank_b, _}})
       when rank_a < rank_b,
       do: false

  defp sort_scored_hands(
         {_, :four_of_a_kind, {_, kicker_a}},
         {_, :four_of_a_kind, {_, kicker_b}}
       ),
       do: kicker_a >= kicker_b

  # Full house tie determined by triplet, then pair
  defp sort_scored_hands({_, :full_house, {triplet_a, _}}, {_, :full_house, {triplet_b, _}})
       when triplet_a > triplet_b,
       do: true

  defp sort_scored_hands({_, :full_house, {triplet_a, _}}, {_, :full_house, {triplet_b, _}})
       when triplet_a < triplet_b,
       do: false

  defp sort_scored_hands({_, :full_house, {_, pair_a}}, {_, :full_house, {_, pair_b}}),
    do: pair_a >= pair_b

  # Flush tie determined by high card, comparing all 5 if necessary
  defp sort_scored_hands({_, :flush, {ranks_a}}, {_, :flush, {ranks_b}}), do: ranks_a >= ranks_b

  # Straight tie determined by high card
  defp sort_scored_hands({_, :straight, {high_a}}, {_, :straight, {high_b}}), do: high_a >= high_b

  # 3-of-a-kind tie determined by triplet, then by high card, comparing both if necessary
  defp sort_scored_hands(
         {_, :three_of_a_kind, {triplet_a, _}},
         {_, :three_of_a_kind, {triplet_b, _}}
       )
       when triplet_a > triplet_b,
       do: true

  defp sort_scored_hands(
         {_, :three_of_a_kind, {triplet_a, _}},
         {_, :three_of_a_kind, {triplet_b, _}}
       )
       when triplet_a < triplet_b,
       do: false

  defp sort_scored_hands(
         {_, :three_of_a_kind, {_, ranks_a}},
         {_, :three_of_a_kind, {_, ranks_b}}
       ),
       do: ranks_a >= ranks_b

  # Two-pair tie determined by high pair, then low pair, then by kicker
  defp sort_scored_hands({_, :two_pair, {high_a, _, _}}, {_, :two_pair, {high_b, _, _}})
       when high_a > high_b,
       do: true

  defp sort_scored_hands({_, :two_pair, {high_a, _, _}}, {_, :two_pair, {high_b, _, _}})
       when high_a < high_b,
       do: false

  defp sort_scored_hands({_, :two_pair, {_, low_a, _}}, {_, :two_pair, {_, low_b, _}})
       when low_a > low_b,
       do: true

  defp sort_scored_hands({_, :two_pair, {_, low_a, _}}, {_, :two_pair, {_, low_b, _}})
       when low_a < low_b,
       do: false

  defp sort_scored_hands({_, :two_pair, {_, _, kicker_a}}, {_, :two_pair, {_, _, kicker_b}}),
    do: kicker_a >= kicker_b

  # Pair tie determined by pair rank, then by high card, comparing all 3 if necessary
  defp sort_scored_hands({_, :pair, {pair_a, _}}, {_, :pair, {pair_b, _}}) when pair_a > pair_b,
    do: true

  defp sort_scored_hands({_, :pair, {pair_a, _}}, {_, :pair, {pair_b, _}}) when pair_a < pair_b,
    do: false

  defp sort_scored_hands({_, :pair, {_, kickers_a}}, {_, :pair, {_, kickers_b}}),
    do: kickers_a >= kickers_b

  # High-card tie determined by high card, comparing all 5 if necessary
  defp sort_scored_hands({_, :high_card, {ranks_a}}, {_, :high_card, {ranks_b}}),
    do: ranks_a >= ranks_b
end

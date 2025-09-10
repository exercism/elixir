defmodule Camicia do
  @doc """
    Simulate a card game between two players.
    Each player has a deck of cards represented as a list of strings.
    Returns a tuple with the result of the game:
    - `{:finished, cards, tricks}` if the game finishes with a winner
    - `{:loop, cards, tricks}` if the game enters a loop
    `cards` is the number of cards played.
    `tricks` is the number of central piles collected.

    ## Examples

      iex> Camicia.simulate(["2"], ["3"])
      {:finished, 2, 1}

      iex> Camicia.simulate(["J", "2", "3"], ["4", "J", "5"])
      {:loop, 8, 3}
  """
  @counts %{"J" => 1, "Q" => 2, "K" => 3, "A" => 4}

  @spec simulate(list, list) :: {:finished | :loop, non_neg_integer(), non_neg_integer()}
  def simulate(playerA, playerB) do
    do_simulate(format_deck(playerA), format_deck(playerB), MapSet.new(), 0, 0, :playerA)
  end

  defp do_simulate([], _playerB, _seen, cards, tricks, _current_player),
    do: {:finished, cards, tricks}

  defp do_simulate(_playerA, [], _seen, cards, tricks, _current_player),
    do: {:finished, cards, tricks}

  defp do_simulate(playerA, playerB, seen, cards, tricks, current_player) do
    state = {playerA, playerB}

    if MapSet.member?(seen, state) do
      {:loop, cards, tricks}
    else
      new_seen = MapSet.put(seen, state)

      {winner, loser, new_cards, new_tricks, next_player} =
        case current_player do
          :playerA -> round(playerA, playerB, cards, tricks, current_player)
          :playerB -> round(playerB, playerA, cards, tricks, current_player)
        end

      case next_player do
        :playerA -> do_simulate(winner, loser, new_seen, new_cards, new_tricks, next_player)
        :playerB -> do_simulate(loser, winner, new_seen, new_cards, new_tricks, next_player)
      end
    end
  end

  defp round(player, opponent, cards, tricks, current_player),
    do: do_round(player, opponent, cards, tricks, :number, [], current_player)

  defp do_round([], opponent, cards, tricks, _type, central_pile, current_player) do
    {opponent ++ Enum.reverse(central_pile), [], cards, tricks + 1, change_player(current_player)}
  end

  defp do_round([card | rest], opponent, cards, tricks, :number, central_pile, current_player) do
    case card do
      "-" ->
        do_round(
          opponent,
          rest,
          cards + 1,
          tricks,
          :number,
          [card | central_pile],
          change_player(current_player)
        )

      payment_card when payment_card in ["J", "Q", "K", "A"] ->
        count = Map.get(@counts, payment_card)

        do_round(
          opponent,
          rest,
          cards + 1,
          tricks,
          {:payment, count},
          [card | central_pile],
          change_player(current_player)
        )
    end
  end

  defp do_round(player, opponent, cards, tricks, {:payment, 0}, central_pile, current_player) do
    {opponent ++ Enum.reverse(central_pile), player, cards, tricks + 1,
     change_player(current_player)}
  end

  defp do_round(
         [card | rest],
         opponent,
         cards,
         tricks,
         {:payment, count},
         central_pile,
         current_player
       ) do
    case card do
      "-" ->
        do_round(
          rest,
          opponent,
          cards + 1,
          tricks,
          {:payment, count - 1},
          [card | central_pile],
          current_player
        )

      payment_card when payment_card in ["J", "Q", "K", "A"] ->
        count = Map.get(@counts, payment_card)

        do_round(
          opponent,
          rest,
          cards + 1,
          tricks,
          {:payment, count},
          [card | central_pile],
          change_player(current_player)
        )
    end
  end

  defp format_deck(deck) do
    Enum.map(deck, fn card ->
      cond do
        card in ["J", "Q", "K", "A"] -> card
        true -> "-"
      end
    end)
  end

  defp change_player(:playerA), do: :playerB
  defp change_player(:playerB), do: :playerA
end

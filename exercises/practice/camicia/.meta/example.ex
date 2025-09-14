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
  @penalties %{"J" => 1, "Q" => 2, "K" => 3, "A" => 4}
  @payment_cards Map.keys(@penalties)

  @spec simulate(list(String.t()), list(String.t())) ::
          {:finished | :loop, non_neg_integer(), non_neg_integer()}
  def simulate(playerA, playerB) do
    initial_state = %{seen: MapSet.new(), cards: 0, tricks: 0, current_player: :playerA}
    do_simulate(format_deck(playerA), format_deck(playerB), initial_state)
  end

  defp do_simulate([], _playerB, %{cards: cards, tricks: tricks}),
    do: {:finished, cards, tricks}

  defp do_simulate(_playerA, [], %{cards: cards, tricks: tricks}),
    do: {:finished, cards, tricks}

  defp do_simulate(playerA, playerB, %{
         seen: seen,
         cards: cards,
         tricks: tricks,
         current_player: current_player
       }) do
    hands = {playerA, playerB}

    if MapSet.member?(seen, hands) do
      {:loop, cards, tricks}
    else
      new_seen = MapSet.put(seen, hands)
      state = %{cards: cards, tricks: tricks, current_player: current_player}

      {winner, loser, %{current_player: next_player} = new_state} =
        case current_player do
          :playerA -> round(playerA, playerB, state)
          :playerB -> round(playerB, playerA, state)
        end

      case next_player do
        :playerA -> do_simulate(winner, loser, new_state |> Map.put(:seen, new_seen))
        :playerB -> do_simulate(loser, winner, new_state |> Map.put(:seen, new_seen))
      end
    end
  end

  defp round(player, opponent, state),
    do: do_round(player, opponent, state, %{type: :number, central_pile: []})

  defp do_round([], opponent, %{cards: cards, tricks: tricks, current_player: current_player}, %{
         type: _,
         central_pile: central_pile
       }) do
    {opponent ++ Enum.reverse(central_pile), [],
     %{cards: cards, tricks: tricks + 1, current_player: change_player(current_player)}}
  end

  defp do_round(
         [card | rest],
         opponent,
         %{cards: cards, tricks: tricks, current_player: current_player},
         %{type: :number, central_pile: central_pile}
       ) do
    new_state = %{cards: cards + 1, tricks: tricks, current_player: change_player(current_player)}

    case card do
      "-" ->
        do_round(
          opponent,
          rest,
          new_state,
          %{type: :number, central_pile: [card | central_pile]}
        )

      payment_card when payment_card in @payment_cards ->
        penalty = Map.get(@penalties, payment_card)

        do_round(
          opponent,
          rest,
          new_state,
          %{type: {:payment, penalty}, central_pile: [card | central_pile]}
        )
    end
  end

  defp do_round(
         player,
         opponent,
         %{cards: cards, tricks: tricks, current_player: current_player},
         %{type: {:payment, 0}, central_pile: central_pile}
       ) do
    {opponent ++ Enum.reverse(central_pile), player,
     %{cards: cards, tricks: tricks + 1, current_player: change_player(current_player)}}
  end

  defp do_round(
         [card | rest],
         opponent,
         %{cards: cards, tricks: tricks, current_player: current_player},
         %{type: {:payment, penalty}, central_pile: central_pile}
       ) do
    case card do
      "-" ->
        do_round(
          rest,
          opponent,
          %{cards: cards + 1, tricks: tricks, current_player: current_player},
          %{type: {:payment, penalty - 1}, central_pile: [card | central_pile]}
        )

      payment_card when payment_card in @payment_cards ->
        penalty = Map.get(@penalties, payment_card)

        do_round(
          opponent,
          rest,
          %{cards: cards + 1, tricks: tricks, current_player: change_player(current_player)},
          %{type: {:payment, penalty}, central_pile: [card | central_pile]}
        )
    end
  end

  defp format_deck(deck) do
    Enum.map(deck, fn card ->
      cond do
        card in @payment_cards -> card
        true -> "-"
      end
    end)
  end

  defp change_player(:playerA), do: :playerB
  defp change_player(:playerB), do: :playerA
end

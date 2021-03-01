defmodule BowlingGame do
  defstruct scores: List.duplicate([0, 0], 12),
            current_frame: 1,
            roll_in_frame: 1
end

defmodule Bowling do
  def start do
    %BowlingGame{}
  end

  def roll(_, score) when score < 0 do
    {:error, "Negative roll is invalid"}
  end

  def roll(_, score) when score > 10 do
    {:error, "Pin count exceeds pins on the lane"}
  end

  def roll(game, score) do
    updates = update_score(game.roll_in_frame, game, score)

    cond do
      too_many_frames?(updates) ->
        {:error, "Cannot roll after game is over"}

      valid_updates?(updates) ->
        {:ok, updates}

      true ->
        {:error, "Pin count exceeds pins on the lane"}
    end
  end

  defp update_score(1, game, score) do
    current_frame = game.current_frame
    scores = List.replace_at(game.scores, current_frame - 1, [score, 0])

    cond do
      score == 10 ->
        %{game | current_frame: current_frame + 1, scores: scores}

      true ->
        %{game | roll_in_frame: 2, scores: scores}
    end
  end

  defp update_score(2, game, score) do
    current_frame = game.current_frame
    old_scores = game.scores
    old_frame_values = Enum.at(old_scores, current_frame - 1)
    new_frame_values = List.replace_at(old_frame_values, 1, score)
    new_scores = List.replace_at(old_scores, current_frame - 1, new_frame_values)
    %{game | scores: new_scores, roll_in_frame: 1, current_frame: current_frame + 1}
  end

  defp valid_updates?(updates) do
    Enum.all?(updates.scores, fn frame -> Enum.sum(frame) <= 10 end)
  end

  def score(game) do
    cond do
      game.current_frame < 10 ->
        {:error, "Score cannot be taken until the end of the game"}

      bonus_roll_remaining?(game) ->
        {:error, "Score cannot be taken until the end of the game"}

      true ->
        {:ok, parse_scores(game.scores)}
    end
  end

  defp bonus_roll_remaining?(game) do
    final_frame = Enum.at(game.scores, 9)

    cond do
      strike?(final_frame) ->
        cond do
          strike?(Enum.at(game.scores, 10)) ->
            game.current_frame == 12 && game.roll_in_frame == 1

          true ->
            game.current_frame < 12
        end

      spare?(final_frame) ->
        game.current_frame == 11 && game.roll_in_frame == 1

      true ->
        false
    end
  end

  defp too_many_frames?(game) do
    final_frame = Enum.at(game.scores, 9)
    bonus_frame_1 = Enum.at(game.scores, 10)
    bonus_frame_2 = Enum.at(game.scores, 11)

    cond do
      # If last frame is all strikes:
      strike?(final_frame) && strike?(bonus_frame_1) && strike?(bonus_frame_2) ->
        game.current_frame == 13 && game.roll_in_frame == 2

      # If last frame has two strikes:
      strike?(final_frame) && strike?(bonus_frame_1) && not strike?(bonus_frame_2) ->
        game.current_frame == 13 && game.roll_in_frame == 1

      # If last frame has one strike and some other combination
      strike?(final_frame) && not strike?(bonus_frame_1) ->
        game.current_frame == 12 && game.roll_in_frame == 2

      # If last frame has a spare, and one strike
      spare?(final_frame) && strike?(bonus_frame_1) ->
        game.current_frame == 12 && game.roll_in_frame == 2

      # If last frame has a spare and some other combination
      spare?(final_frame) && not strike?(bonus_frame_1) ->
        game.current_frame == 12 && game.roll_in_frame == 1

      # All of the others
      true ->
        game.current_frame == 11 && game.roll_in_frame == 2
    end
  end

  defp parse_scores(scores) do
    scores
    |> score_frames
    |> Enum.sum()
  end

  defp score_frames(scores) do
    Enum.map(0..9, fn idx ->
      current_frame = Enum.at(scores, idx)
      next_frame = Enum.at(scores, idx + 1, [0, 0])

      cond do
        strike?(current_frame) ->
          strike(current_frame, next_frame, scores, idx)

        spare?(current_frame) ->
          10 + hd(next_frame)

        true ->
          Enum.sum(current_frame)
      end
    end)
  end

  defp strike?(frame) do
    frame == [10, 0]
  end

  defp strike(current_frame, next_frame, scores, idx) do
    if strike?(next_frame) do
      Enum.sum(current_frame) + Enum.sum(next_frame) +
        (Enum.at(scores, idx + 2, [0, 0]) |> Enum.at(0))
    else
      Enum.sum(Enum.at(scores, idx)) + Enum.sum(Enum.at(scores, idx + 1, [0, 0]))
    end
  end

  defp spare?(frame) do
    Enum.sum(frame) == 10
  end
end

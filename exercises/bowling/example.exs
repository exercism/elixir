defmodule BowlingGame do
  defstruct scores: List.duplicate([0,0], 12),
            current_frame: 1,
            roll_in_frame: 1
end

defmodule Bowling do
  def start do
    %BowlingGame{}
  end

  def roll(_, score) when score < 0 do
    {:error, "Pins must have a value from 0 to 10"}
  end

  def roll(_, score) when score > 10 do
    {:error, "Pins must have a value from 0 to 10"}
  end

  def roll(game, score) do
    updates = update_score(game.roll_in_frame, game, score)
    cond do
      valid_updates?(updates) ->
        updates
      true ->
        {:error, "Pin count exceeds pins on the lane"}
    end
  end

  defp update_score(1, game, score) do
    current_frame = game.current_frame
    scores = List.replace_at(game.scores, current_frame - 1, [score, 0])
    cond do
      score == 10 ->
        %{ game | current_frame: current_frame + 1, scores: scores }
      true ->
        %{ game | roll_in_frame: 2, scores: scores }
    end
  end

  defp update_score(2, game, score) do
    current_frame = game.current_frame
    old_scores = game.scores
    old_frame_values = Enum.at(old_scores, current_frame - 1)
    new_frame_values = List.replace_at(old_frame_values, 1, score)
    new_scores = List.replace_at(old_scores, current_frame - 1, new_frame_values)
    %{ game | scores: new_scores, roll_in_frame: 1,
              current_frame: current_frame + 1 }
  end

  defp valid_updates?(updates) do
    Enum.all?(updates.scores, fn(frame) -> Enum.sum(frame) <= 10 end)
  end

  def score(game) do
    if game.current_frame < 10 do
      {:error, "Score cannot be taken until the end of the game"}
    else
      parse_scores(game.scores)
    end
  end

  defp parse_scores(scores) do
    scores
    |> score_frames
    |> Enum.sum
  end

  defp score_frames(scores) do
    Enum.map((0..9), fn(idx) ->
      current_frame = Enum.at(scores, idx)
      next_frame = Enum.at(scores, idx + 1, [0,0])
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
      Enum.sum(Enum.at(scores, idx)) + Enum.sum(Enum.at(scores, idx + 1, [0,0]))
    end
  end

  defp spare?(frame) do
    Enum.sum(frame) == 10
  end
end

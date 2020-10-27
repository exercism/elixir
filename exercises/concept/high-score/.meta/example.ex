defmodule HighScore do
  @initial_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @initial_score)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def order_by_players(scores) do
    scores
    |> Map.to_list()
    |> Enum.sort_by(&(&1 |> Kernel.elem(0) |> String.downcase()))
  end

  def order_by_scores(scores) do
    scores
    |> Map.to_list()
    |> Enum.sort_by(&Kernel.elem(&1, 1), &>=/2)
  end
end

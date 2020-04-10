defmodule Rules do
  def eat_ghost?(ate_pill, touching_ghost) do
    ate_pill and touching_ghost
  end

  def score?(ate_pill, ate_dot) do
    ate_pill or ate_dot
  end

  def lose?(ate_pill, touching_ghost) do
    not ate_pill and touching_ghost
  end

  def win?(ate_all_dots, ate_pill, touching_ghost) do
    ate_all_dots and not lose?(ate_pill, touching_ghost)
  end
end

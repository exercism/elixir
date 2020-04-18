defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    raise "Please implement the eat_ghost?/2  function"
  end

  def score?(touching_power_pellet, touching_power_pellet) do
    raise "Please implement the score?/2  function"
  end

  def lose?(power_pellet_active, touching_ghost) do
    raise "Please implement the lose?/2  function"
  end

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    raise "Please implement the win?/3  function"
  end
end

defmodule RPNCalculatorInspection do
  def speed_check(calculator, inputs) do
    inputs
    |> Enum.map(fn input ->
      Task.async(fn -> calculator.(input) end)
    end)
    |> Enum.map(fn task -> Task.await(task, 100) end)
  end
end

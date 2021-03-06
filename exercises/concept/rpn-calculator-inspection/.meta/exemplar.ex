defmodule RPNCalculatorInspection do
  def speed_check(calculator, inputs) do
    inputs
    |> Enum.map(fn input ->
      Task.async(fn -> calculator.(input) end)
    end)
    |> Enum.map(fn task -> Task.await(task, 100) end)
  end

#  def reliability_check(calculator, inputs) do
#    Process.flag(:trap_exit, true)
#
#
#  end
end

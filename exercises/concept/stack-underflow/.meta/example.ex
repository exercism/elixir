defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      error = %StackUnderflowError{}
      case value do
        [] -> error
        _ ->  %{error | message: "#{error.message}, context: #{value}"}
      end
    end
  end

  def divide(stack) when length(stack) < 2, do: raise StackUnderflowError, "when dividing"
  def divide([divisor, _number | _]) when divisor == 0, do: raise DivisionByZeroError
  def divide([divisor, number | _]), do: number / divisor
end

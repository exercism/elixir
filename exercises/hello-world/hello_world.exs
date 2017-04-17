defmodule HelloWorld do
  @moduledoc """
  Elixir counts the number of arguments as part of the function name.
  For instance;

      def hello() do
      end

  would be a completely different function from

      def hello(name) do
      end

  Can you find a way to make all the tests pass with just one
  function?

  Hint: look into argument defaults here:
  http://elixir-lang.org/getting-started/modules-and-functions.html#default-arguments
  """

  @doc """
  Greets the user by name, or by saying "Hello, World!"
  if no name is given.
  """
  @spec hello(String.t) :: String.t
  def hello(name) do

    "Your implementation goes here"

  end
end

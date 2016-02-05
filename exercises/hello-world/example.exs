defmodule HelloWorld do

  @doc """
  Greets the user by name, or by saying "Hello, World!"
  if no name is given
  """

  def hello(name \\ "World") do

    "Hello, " <> name <> "!"

  end
end

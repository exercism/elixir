if System.get_env("EXERCISM_TEST_EXAMPLES") do
  ExUnit.start()
  ExUnit.configure(exclude: :pending, trace: true)
end

defmodule HelloWorldTest do
  use ExUnit.Case

  test "says 'Hello, World!'" do
    assert HelloWorld.hello() == "Hello, World!"
  end
end

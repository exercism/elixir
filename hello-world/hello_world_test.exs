Code.load_file("../file_loader.ex", __DIR__)
FileLoader.load("hello_world", __DIR__)

defmodule HelloWorldTest do
  use ExUnit.Case, async: true

  test "says hello with no name" do
    assert HelloWorld.hello() == "Hello, World!"
  end

  @tag :pending
  test "says hello sample name" do
    assert HelloWorld.hello("Alice") == "Hello, Alice!"
  end

  @tag :pending
  test "says hello other sample name" do
    assert HelloWorld.hello("Bob") == "Hello, Bob!"
  end

end

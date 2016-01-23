unless Code.ensure_loaded?(FileLoader) do
  defmodule FileLoader do
    def load(name, dir) do
      if System.get_env("EXERCISM_TEST_EXAMPLES") do
        Code.load_file("example.exs", dir)
      else
        Code.load_file("#{name}.exs", dir)
      end

      ExUnit.start
      ExUnit.configure exclude: :pending, trace: true
    end
  end
end

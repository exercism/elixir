defmodule ExercismTestRunner.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tests,
      version: "0.0.1",
      elixir: "~> 1.3",
      deps: deps(),
      test_paths: ["exercises"],
      consolidate_protocols: false,
      dialyzer: [paths: ["tmp/build"]]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:poison, "~> 1.4.0"}, {:dialyxir, "~> 0.5"}]
  end
end

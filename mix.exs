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
      dialyzer: [
        paths: ["_build"],
        plt_core_path: "priv/plts",
        plt_file: {:no_warn, "priv/plts/eventstore.plt"},
        ignore_warnings: ".dialyzer_ignore.exs"
      ]
    ]
  end

  def application do
    [extra_applications: [:logger, :dialyzer]]
  end

  defp deps do
    [
      {:dialyxir, "~> 1.3.0", runtime: false},
      {:markdown_code_block_formatter,
       git: "https://github.com/angelikatyborska/markdown_code_block_formatter",
       tag: "5b6de6ac6621cab2c9bd4abc9d9797dd2e9846f8",
       runtime: false}
    ]
  end
end

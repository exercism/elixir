# Rename exercise lib and test files the canonical way
# Run from the root of the repo with elixir bin/rename.exs

Mix.install([{:jason, "~> 1.2"}])

defmodule Rename do
  def rename(type, slug) do
    snake_slug = String.replace(slug, "-", "_")

    slug_path = "exercises/#{type}/#{slug}/"

    config_path = slug_path <> ".meta/config.json"
    lib_path = "lib/#{snake_slug}.ex"
    test_path = "test/#{snake_slug}_test.exs"

    %{"files" => %{"solution" => [solution], "test" => [test]} = files} =
      config =
      File.read!(config_path)
      |> Jason.decode!()

    config =
      %{config | "files" => %{files | "solution" => [lib_path], "test" => [test_path]}}
      |> Jason.encode!(pretty: true)

    if solution != lib_path do
      File.rename(slug_path <> solution, slug_path <> lib_path)
      File.write!(config_path, config)
    end

    if test != test_path do
      File.rename(slug_path <> test, slug_path <> test_path)
      File.write!(config_path, config)
    end
  end
end

%{"exercises" => %{"concept" => concept, "practice" => practice}} =
  File.read!("config.json")
  |> Jason.decode!()

Enum.map(concept, fn %{"slug" => slug} -> Rename.rename("concept", slug) end)
Enum.map(practice, fn %{"slug" => slug} -> Rename.rename("practice", slug) end)

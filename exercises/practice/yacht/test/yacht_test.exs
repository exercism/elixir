defmodule YachtTest do
  use ExUnit.Case

  @data Application.app_dir(:yacht, "priv/canonical-data.json")
        |> File.read!()
        |> Jason.decode!()

  for test_case <- @data["cases"] do
    test test_case["description"] do
      assert Yacht.score(
               unquote(test_case["input"]["category"]),
               unquote(test_case["input"]["dice"])
             ) == unquote(test_case["expected"])
    end
  end
end

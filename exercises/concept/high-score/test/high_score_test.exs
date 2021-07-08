defmodule HighScoreTest do
  use ExUnit.Case

  # Trivia: Scores used in this test suite are based on lines of code
  # added to the elixir-lang/elixir github repository as of Apr 27, 2020.

  @tag task_id: 1
  test "new/1 result in empty score map" do
    assert HighScore.new() == %{}
  end

  describe "add_player/2" do
    @tag task_id: 2
    test "add player without score to empty score map" do
      scores = HighScore.new()

      assert HighScore.add_player(scores, "José Valim") == %{"José Valim" => 0}
    end

    @tag task_id: 2
    test "add two players without score to empty map" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.add_player("Chris McCord")

      assert scores == %{"Chris McCord" => 0, "José Valim" => 0}
    end

    @tag task_id: 2
    test "add player with score to empty score map" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim", 486_373)

      assert scores == %{"José Valim" => 486_373}
    end

    @tag task_id: 2
    test "add players with scores to empty score map" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim", 486_373)
        |> HighScore.add_player("Dave Thomas", 2_374)

      assert scores == %{"José Valim" => 486_373, "Dave Thomas" => 2_374}
    end
  end

  describe "remove_player/2" do
    @tag task_id: 3
    test "remove from empty score map results in empty score map" do
      scores =
        HighScore.new()
        |> HighScore.remove_player("José Valim")

      assert scores == %{}
    end

    @tag task_id: 3
    test "remove player after adding results in empty score map" do
      map =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.remove_player("José Valim")

      assert map == %{}
    end

    @tag task_id: 3
    test "remove first player after adding two results in map with remaining player" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.add_player("Chris McCord")
        |> HighScore.remove_player("José Valim")

      assert scores == %{"Chris McCord" => 0}
    end

    @tag task_id: 3
    test "remove second player after adding two results in map with remaining player" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.add_player("Chris McCord")
        |> HighScore.remove_player("Chris McCord")

      assert scores == %{"José Valim" => 0}
    end
  end

  describe "reset_score/2" do
    @tag task_id: 4
    test "resetting score for non-existent player sets player score to 0" do
      scores =
        HighScore.new()
        |> HighScore.reset_score("José Valim")

      assert scores == %{"José Valim" => 0}
    end

    @tag task_id: 4
    test "resetting score for existing player sets previous player score to 0" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.update_score("José Valim", 486_373)
        |> HighScore.reset_score("José Valim")

      assert scores == %{"José Valim" => 0}
    end
  end

  describe "update_score/3" do
    @tag task_id: 5
    test "update score for non existent player initializes value" do
      scores =
        HighScore.new()
        |> HighScore.update_score("José Valim", 486_373)

      assert scores == %{"José Valim" => 486_373}
    end

    @tag task_id: 5
    test "update score for existing player adds score to previous" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.update_score("José Valim", 486_373)

      assert scores == %{"José Valim" => 486_373}
    end

    @tag task_id: 5
    test "update score for existing player with non-zero score adds score to previous" do
      scores =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.update_score("José Valim", 1)
        |> HighScore.update_score("José Valim", 486_373)

      assert scores == %{"José Valim" => 486_374}
    end
  end

  describe "get_players/1" do
    @tag task_id: 6
    test "empty score map gives empty list" do
      scores_by_player =
        HighScore.new()
        |> HighScore.get_players()

      assert scores_by_player == []
    end

    @tag task_id: 6
    test "score map with one entry gives one result" do
      players =
        HighScore.new()
        |> HighScore.add_player("José Valim")
        |> HighScore.update_score("José Valim", 486_373)
        |> HighScore.get_players()

      assert players == ["José Valim"]
    end

    @tag task_id: 6
    test "score map with multiple entries gives results in unknown order" do
      players =
        HighScore.new()
        |> HighScore.add_player("José Valim", 486_373)
        |> HighScore.add_player("Dave Thomas", 2_374)
        |> HighScore.add_player("Chris McCord", 0)
        |> HighScore.add_player("Saša Jurić", 762)
        |> HighScore.get_players()
        |> Enum.sort()

      assert players == [
               "Chris McCord",
               "Dave Thomas",
               "José Valim",
               "Saša Jurić"
             ]
    end
  end
end

defmodule HighScoreTest do
  use ExUnit.Case

  # Trivia: Scores are based on lines added to the elixir-lang/elixir
  # github repository as of Apr 27, 2020.
  @chris {"Chris McCord", 0}
  @jose {"José Valim", 486_373}
  @dave {"Dave Thomas", 2_374}
  @sasa {"Saša Jurić", 762}

  # @tag :pending
  test "new/1 result in empty score map" do
    assert HighScore.new() == %{}
  end

  describe "add_player/2" do
    @tag :pending
    test "add player without score to empty score map" do
      {name, _} = @jose
      scores = HighScore.new()

      assert HighScore.add_player(scores, name) == %{name => 0}
    end

    @tag :pending
    test "add two players without score to empty map" do
      {jose, _} = @jose
      {chris, _} = @chris
      scores =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.add_player(chris)

      assert scores == %{chris => 0, jose => 0}
    end

    @tag :pending
    test "add player with score to empty score map" do
      {name, score} = @jose
      scores =
        HighScore.new()
        |> HighScore.add_player(name, score)

      assert scores == %{name => score}
    end

    @tag :pending
    test "add players with scores to empty score map" do
      {jose, jose_score} = @jose
      {dave, dave_score} = @dave
      scores =
        HighScore.new()
        |> HighScore.add_player(jose, jose_score)
        |> HighScore.add_player(dave, dave_score)

      assert scores == %{jose => jose_score, dave => dave_score}
    end
  end

  describe "remove_player/2" do
    @tag :pending
    test "remove from empty score map results in empty score map" do
      {jose, _} = @jose

      assert HighScore.new() |> HighScore.remove_player(jose) == %{}
    end

    @tag :pending
    test "remove player after adding results in empty score map" do
      {jose, _} = @jose
      map =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.remove_player(jose)

      assert map == %{}
    end

    @tag :pending
    test "remove first player after adding two results in map with remaining player" do
      {jose, _} = @jose
      {chris, _} = @chris
      scores =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.add_player(chris)
        |> HighScore.remove_player(jose)

      assert scores == %{chris => 0}
    end

    @tag :pending
    test "remove second player after adding two results in map with remaining player" do
      {jose, _} = @jose
      {chris, _} = @chris
      scores =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.add_player(chris)
        |> HighScore.remove_player(chris)

      assert scores == %{jose => 0}
    end
  end

  describe "reset_score/2" do
    @tag :pending
    test "resetting score for non-existent player sets player score to 0" do
      {jose, _score} = @jose
      scores =
        HighScore.new()
        |> HighScore.reset_score(jose)

      assert scores == %{jose => 0}
    end

    @tag :pending
    test "resetting score for existing player sets previous player score to 0" do
      {jose, score} = @jose
      scores =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.update_score(jose, score)
        |> HighScore.reset_score(jose)

      assert scores == %{jose => 0}
    end
  end

  describe "update_score/3" do
    @tag :pending
    test "update score for non existent player initializes value" do
      {jose, score} = @jose
      scores =
        HighScore.new()
        |> HighScore.update_score(jose, score)

      assert scores = %{jose => score}
    end

    @tag :pending
    test "update score for existing player adds score to previous" do
      {jose, score} = @jose
      scores =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.update_score(jose, score)

      assert scores == %{jose => score}
    end

    @tag :pending
    test "update score for existing player with non-zero score adds score to previous" do
      {jose, score} = @jose
      scores =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.update_score(jose, 1)
        |> HighScore.update_score(jose, score)

      assert scores == %{jose => score + 1}
    end
  end

  describe "order_by_players/1" do
    @tag :pending
    test "empty score map gives empty list" do
      scores_by_player =
        HighScore.new()
        |> HighScore.order_by_players()

      assert scores_by_player == []
    end

    @tag :pending
    test "score map with one entry gives one result" do
      {jose, score} = @jose
      scores_by_player =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.update_score(jose, score)
        |> HighScore.order_by_players()

      assert scores_by_player == [@jose]
    end

    @tag :pending
    test "score map with two entries gives ordered result" do
      {jose, jose_score} = @jose
      {dave, dave_score} = @dave
      scores_by_player =
        HighScore.new()
        |> HighScore.add_player(jose, jose_score)
        |> HighScore.add_player(dave, dave_score)
        |> HighScore.order_by_players()

      assert scores_by_player == [@dave, @jose]
    end

    @tag :pending
    test "score map with multiple entries gives ordered result" do
      {jose, jose_score} = @jose
      {dave, dave_score} = @dave
      {chris, chris_score} = @chris
      {sasa, sasa_score} = @sasa

      scores_by_player =
        HighScore.new()
        |> HighScore.add_player(jose, jose_score)
        |> HighScore.add_player(dave, dave_score)
        |> HighScore.add_player(chris, chris_score)
        |> HighScore.add_player(sasa, sasa_score)
        |> HighScore.order_by_players()

      assert scores_by_player == [@chris, @dave, @jose, @sasa]
    end
  end

  describe "order_by_scores/1" do
    @tag :pending
    test "empty score map gives empty list" do
      scores_by_player =
        HighScore.new()
        |> HighScore.order_by_scores()

      assert scores_by_player == []
    end

    @tag :pending
    test "score map with one entry gives one result" do
      {jose, score} = @jose
      scores_by_player =
        HighScore.new()
        |> HighScore.add_player(jose)
        |> HighScore.update_score(jose, score)
        |> HighScore.order_by_scores()

      assert scores_by_player == [@jose]
    end

    @tag :pending
    test "score map with two entries gives ordered result" do
      {jose, jose_score} = @jose
      {dave, dave_score} = @dave
      scores_by_player =
        HighScore.new()
        |> HighScore.add_player(jose, jose_score)
        |> HighScore.add_player(dave, dave_score)
        |> HighScore.order_by_scores()

      assert scores_by_player == [@jose, @dave]
    end

    @tag :pending
    test "score map with multiple entries gives ordered result" do
      {jose, jose_score} = @jose
      {dave, dave_score} = @dave
      {chris, chris_score} = @chris
      {sasa, sasa_score} = @sasa

      scores_by_player =
        HighScore.new()
        |> HighScore.add_player(jose, jose_score)
        |> HighScore.add_player(dave, dave_score)
        |> HighScore.add_player(chris, chris_score)
        |> HighScore.add_player(sasa, sasa_score)
        |> HighScore.order_by_scores()

      assert scores_by_player == [@jose, @dave, @sasa, @chris]
    end
  end
end

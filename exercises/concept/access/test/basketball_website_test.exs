defmodule BasketballWebsiteTest do
  use ExUnit.Case

  @team_data %{
    "coach" => %{
      "first_name" => "Jane",
      "last_name" => "Brown"
    },
    "team_name" => "Hoop Masters",
    "players" => %{
      "99" => %{
        "first_name" => "Amalee",
        "last_name" => "Tynemouth",
        "email" => "atynemouth0@yellowpages.com",
        "statistics" => %{
          "average_points_per_game" => 3.5,
          "free_throws_made" => 4,
          "free_throws_attempted" => 5
        }
      },
      "98" => %{
        "first_name" => "Tiffie",
        "last_name" => "Derle",
        "email" => "tderle1@vimeo.com",
        "statistics" => %{
          "average_points_per_game" => 20.2,
          "free_throws_made" => 6,
          "free_throws_attempted" => 6
        }
      },
      "23" => %{
        "first_name" => "Garfield",
        "last_name" => "Beeho",
        "email" => nil,
        "statistics" => %{
          "average_points_per_game" => 14.1,
          "free_throws_made" => 3,
          "free_throws_attempted" => 7
        }
      },
      "36" => %{
        "first_name" => "Clio",
        "last_name" => "Serfati",
        "email" => "cserfati3@comsenz.com",
        "statistics" => %{
          "average_points_per_game" => 17.4,
          "free_throws_made" => 2,
          "free_throws_attempted" => 4
        }
      },
      "42" => %{
        "first_name" => "Conchita",
        "last_name" => "Elham",
        "email" => "celham4@wikia.com",
        "statistics" => %{
          "average_points_per_game" => 4.6,
          "free_throws_made" => 7,
          "free_throws_attempted" => 10
        }
      },
      "61" => %{
        "first_name" => "Noel",
        "last_name" => "Fawlkes",
        "email" => "nfawlkes5@yahoo.co.jp",
        "statistics" => %{
          "average_points_per_game" => 5.0,
          "free_throws_made" => 5,
          "free_throws_attempted" => 5
        }
      },
      "53" => %{
        "first_name" => "Lucine",
        "last_name" => "Russel",
        "email" => "lrussel6@fotki.com",
        "statistics" => %{
          "average_points_per_game" => 7.2,
          "free_throws_made" => 1,
          "free_throws_attempted" => 5
        }
      },
      "12" => %{
        "first_name" => "Andy",
        "last_name" => "Napoli",
        "email" => "anapoli7@goodreads.com",
        "statistics" => %{
          "average_points_per_game" => 7
        }
      },
      "9" => %{
        "first_name" => "Ivar",
        "last_name" => "Longson",
        "email" => "ilongson8@timesonline.co.uk",
        "statistics" => %{
          "average_points_per_game" => 9.0,
          "free_throws_made" => 8,
          "free_throws_attempted" => 9
        }
      },
      "32" => %{
        "first_name" => "Deni",
        "last_name" => "Lidster",
        "email" => nil,
        "statistics" => %{
          "average_points_per_game" => 0.0,
          "free_throws_made" => 3,
          "free_throws_attempted" => 5
        }
      }
    }
  }

  describe "extract_from_path retrieves from" do
    test "first layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "team_name") == "Hoop Masters"
    end

    test "second layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "coach.first_name") == "Jane"
    end

    test "third layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "players.99.first_name") == "Amalee"
    end

    test "fourth layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "players.61.statistics.average_points_per_game") === 5.0
    end
  end

  describe "extract_from_path returns nil from nonexistent last key in" do
    test "first layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "team_song") == nil
    end

    test "second layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "coach.age") == nil
    end

    test "third layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "players.32.height") == nil
    end

    test "fourth layer" do
      assert BasketballWebsite.extract_from_path(@team_data, "players.12.statistics.personal_fouls") == nil
    end
  end

  test "extract_from_path returns nil from nonexistent path" do
    assert BasketballWebsite.extract_from_path(@team_data, "support_personnel.physiotherapy.first_name") == nil
  end

  describe "get_in_path retrieves from" do
    test "first layer" do
      assert BasketballWebsite.get_in_path(@team_data, "team_name") == "Hoop Masters"
    end

    test "second layer" do
      assert BasketballWebsite.get_in_path(@team_data, "coach.first_name") == "Jane"
    end

    test "third layer" do
      assert BasketballWebsite.get_in_path(@team_data, "players.99.first_name") == "Amalee"
    end

    test "fourth layer" do
      assert BasketballWebsite.get_in_path(@team_data, "players.61.statistics.average_points_per_game") === 5.0
    end
  end

  describe "get_in_path returns nil from nonexistent last key in" do
    test "first layer" do
      assert BasketballWebsite.get_in_path(@team_data, "team_song") == nil
    end

    test "second layer" do
      assert BasketballWebsite.get_in_path(@team_data, "coach.age") == nil
    end

    test "third layer" do
      assert BasketballWebsite.get_in_path(@team_data, "players.32.height") == nil
    end

    test "fourth layer" do
      assert BasketballWebsite.get_in_path(@team_data, "players.12.statistics.personal_fouls") == nil
    end
  end

  test "get_in_path returns nil from nonexistent path" do
    assert BasketballWebsite.get_in_path(@team_data, "support_personnel.physiotherapy.first_name") == nil
  end
end

defmodule BasketballWebsiteTest do
  use ExUnit.Case

  describe "extract_from_path retrieves from" do
    @tag task_id: 1
    test "first layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.extract_from_path(team_data, "team_name") == "Hoop Masters"
    end

    @tag task_id: 1
    test "second layer" do
      team_data = %{
        "coach" => %{
          "first_name" => "Jane",
          "last_name" => "Brown"
        },
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.extract_from_path(team_data, "coach.first_name") == "Jane"
    end

    @tag task_id: 1
    test "third layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
          "99" => %{
            "first_name" => "Amalee",
            "last_name" => "Tynemouth",
            "email" => "atynemouth0@yellowpages.com",
            "statistics" => %{}
          },
          "98" => %{
            "first_name" => "Tiffie",
            "last_name" => "Derle",
            "email" => "tderle1@vimeo.com",
            "statistics" => %{}
          }
        }
      }

      assert BasketballWebsite.extract_from_path(team_data, "players.99.first_name") == "Amalee"
    end

    @tag task_id: 1
    test "fourth layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
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
          }
        }
      }

      assert BasketballWebsite.extract_from_path(
               team_data,
               "players.61.statistics.average_points_per_game"
             ) === 5.0
    end
  end

  describe "extract_from_path returns nil from nonexistent last key in" do
    @tag task_id: 1
    test "first layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.extract_from_path(team_data, "team_song") == nil
    end

    @tag task_id: 1
    test "second layer" do
      team_data = %{
        "coach" => %{
          "first_name" => "Jane",
          "last_name" => "Brown"
        },
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.extract_from_path(team_data, "coach.age") == nil
    end

    @tag task_id: 1
    test "third layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
          "32" => %{
            "first_name" => "Deni",
            "last_name" => "Lidster",
            "email" => nil,
            "statistics" => %{}
          }
        }
      }

      assert BasketballWebsite.extract_from_path(team_data, "players.32.height") == nil
    end

    @tag task_id: 1
    test "fourth layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
          "12" => %{
            "first_name" => "Andy",
            "last_name" => "Napoli",
            "email" => "anapoli7@goodreads.com",
            "statistics" => %{
              "average_points_per_game" => 7
            }
          }
        }
      }

      assert BasketballWebsite.extract_from_path(
               team_data,
               "players.12.statistics.personal_fouls"
             ) == nil
    end
  end

  @tag task_id: 1
  test "extract_from_path returns nil from nonexistent path" do
    team_data = %{
      "coach" => %{},
      "team_name" => "Hoop Masters",
      "players" => %{}
    }

    assert BasketballWebsite.extract_from_path(
             team_data,
             "support_personnel.physiotherapy.first_name"
           ) == nil
  end

  describe "get_in_path retrieves from" do
    @tag task_id: 2
    test "first layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.get_in_path(team_data, "team_name") == "Hoop Masters"
    end

    @tag task_id: 2
    test "second layer" do
      team_data = %{
        "coach" => %{
          "first_name" => "Jane",
          "last_name" => "Brown"
        },
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.get_in_path(team_data, "coach.first_name") == "Jane"
    end

    @tag task_id: 2
    test "third layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
          "99" => %{
            "first_name" => "Amalee",
            "last_name" => "Tynemouth",
            "email" => "atynemouth0@yellowpages.com",
            "statistics" => %{}
          },
          "98" => %{
            "first_name" => "Tiffie",
            "last_name" => "Derle",
            "email" => "tderle1@vimeo.com",
            "statistics" => %{}
          }
        }
      }

      assert BasketballWebsite.get_in_path(team_data, "players.99.first_name") == "Amalee"
    end

    @tag task_id: 2
    test "fourth layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
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
          }
        }
      }

      assert BasketballWebsite.get_in_path(
               team_data,
               "players.61.statistics.average_points_per_game"
             ) === 5.0
    end
  end

  describe "get_in_path returns nil from nonexistent last key in" do
    @tag task_id: 2
    test "first layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.get_in_path(team_data, "team_song") == nil
    end

    @tag task_id: 2
    test "second layer" do
      team_data = %{
        "coach" => %{
          "first_name" => "Jane",
          "last_name" => "Brown"
        },
        "team_name" => "Hoop Masters",
        "players" => %{}
      }

      assert BasketballWebsite.get_in_path(team_data, "coach.age") == nil
    end

    @tag task_id: 2
    test "third layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
          "32" => %{
            "first_name" => "Deni",
            "last_name" => "Lidster",
            "email" => nil,
            "statistics" => %{}
          }
        }
      }

      assert BasketballWebsite.get_in_path(team_data, "players.32.height") == nil
    end

    @tag task_id: 2
    test "fourth layer" do
      team_data = %{
        "coach" => %{},
        "team_name" => "Hoop Masters",
        "players" => %{
          "12" => %{
            "first_name" => "Andy",
            "last_name" => "Napoli",
            "email" => "anapoli7@goodreads.com",
            "statistics" => %{
              "average_points_per_game" => 7
            }
          }
        }
      }

      assert BasketballWebsite.get_in_path(team_data, "players.12.statistics.personal_fouls") ==
               nil
    end
  end

  @tag task_id: 2
  test "get_in_path returns nil from nonexistent path" do
    team_data = %{
      "coach" => %{},
      "team_name" => "Hoop Masters",
      "players" => %{}
    }

    assert BasketballWebsite.get_in_path(team_data, "support_personnel.physiotherapy.first_name") ==
             nil
  end
end

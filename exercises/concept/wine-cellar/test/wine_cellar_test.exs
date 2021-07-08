defmodule WineCellarTest do
  use ExUnit.Case

  describe "explain_colors/0" do
    @tag task_id: 1
    test "returns a keyword list" do
      assert WineCellar.explain_colors() == [
               white: "Fermented without skin contact.",
               red: "Fermented with skin contact using dark-colored grapes.",
               rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
             ]
    end
  end

  describe "filter/3" do
    @tag task_id: 2
    test "works for empty cellar" do
      assert WineCellar.filter([], :rose) == []
    end

    @tag task_id: 2
    test "returns all wines of a chosen color" do
      cellar = [
        white: {"Chardonnay", 2015, "Italy"},
        white: {"Chardonnay", 2014, "France"},
        rose: {"Dornfelder", 2018, "Germany"},
        red: {"Merlot", 2015, "France"},
        white: {"Riesling ", 2017, "Germany"},
        white: {"Pinot grigio", 2015, "Germany"},
        red: {"Pinot noir", 2016, "France"},
        red: {"Pinot noir", 2013, "Italy"}
      ]

      assert WineCellar.filter(cellar, :white) == [
               {"Chardonnay", 2015, "Italy"},
               {"Chardonnay", 2014, "France"},
               {"Riesling ", 2017, "Germany"},
               {"Pinot grigio", 2015, "Germany"}
             ]

      assert WineCellar.filter(cellar, :rose) == [{"Dornfelder", 2018, "Germany"}]
    end

    @tag task_id: 3
    test "filters wines of chosen color by year" do
      cellar = [
        white: {"Chardonnay", 2015, "Italy"},
        white: {"Chardonnay", 2014, "France"},
        rose: {"Dornfelder", 2018, "Germany"},
        red: {"Merlot", 2015, "France"},
        white: {"Riesling ", 2017, "Germany"},
        white: {"Pinot grigio", 2015, "Germany"},
        red: {"Pinot noir", 2016, "France"},
        red: {"Pinot noir", 2013, "Italy"}
      ]

      assert WineCellar.filter(cellar, :white, year: 2015) == [
               {"Chardonnay", 2015, "Italy"},
               {"Pinot grigio", 2015, "Germany"}
             ]
    end

    @tag task_id: 4
    test "filters wines of chosen color by country" do
      cellar = [
        white: {"Chardonnay", 2015, "Italy"},
        white: {"Chardonnay", 2014, "France"},
        rose: {"Dornfelder", 2018, "Germany"},
        red: {"Merlot", 2015, "France"},
        white: {"Riesling ", 2017, "Germany"},
        white: {"Pinot grigio", 2015, "Germany"},
        red: {"Pinot noir", 2016, "France"},
        red: {"Pinot noir", 2013, "Italy"}
      ]

      assert WineCellar.filter(cellar, :red, country: "France") == [
               {"Merlot", 2015, "France"},
               {"Pinot noir", 2016, "France"}
             ]
    end

    @tag task_id: 4
    test "filters wines of chosen color by year and country" do
      cellar = [
        white: {"Chardonnay", 2015, "Italy"},
        white: {"Chardonnay", 2014, "France"},
        rose: {"Dornfelder", 2018, "Germany"},
        red: {"Merlot", 2015, "France"},
        white: {"Riesling ", 2017, "Germany"},
        white: {"Pinot grigio", 2015, "Germany"},
        red: {"Pinot noir", 2016, "France"},
        red: {"Pinot noir", 2013, "Italy"}
      ]

      assert WineCellar.filter(cellar, :white, year: 2015, country: "Germany") == [
               {"Pinot grigio", 2015, "Germany"}
             ]
    end

    @tag task_id: 4
    test "filters wines of chosen color by country and year" do
      cellar = [
        white: {"Chardonnay", 2015, "Italy"},
        white: {"Chardonnay", 2014, "France"},
        rose: {"Dornfelder", 2018, "Germany"},
        red: {"Merlot", 2015, "France"},
        white: {"Riesling ", 2017, "Germany"},
        white: {"Pinot grigio", 2015, "Germany"},
        red: {"Pinot noir", 2016, "France"},
        red: {"Pinot noir", 2013, "Italy"}
      ]

      assert WineCellar.filter(cellar, :red, country: "France", year: 2015) == [
               {"Merlot", 2015, "France"}
             ]
    end
  end
end

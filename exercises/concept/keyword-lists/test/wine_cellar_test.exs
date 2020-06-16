defmodule WineCellarTest do
  use ExUnit.Case

  @cellar [
    white: {"Chardonnay", 2015, "Italy"},
    white: {"Chardonnay", 2014, "France"},
    rose: {"Dornfelder", 2018, "Germany"},
    red: {"Merlot", 2015, "France"},
    white: {"Riesling ", 2017, "Germany"},
    white: {"Pinot grigio", 2015, "Germany"},
    red: {"Pinot noir", 2016, "France"},
    red: {"Pinot noir", 2013, "Italy"}
  ]

  describe "explain_colors/0" do
    test "returns a keyword list" do
      assert WineCellar.explain_colors() == [
               white: "Fermented without skin contact.",
               red: "Fermented with skin contact using dark-colored grapes.",
               rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
             ]
    end
  end

  describe "filter/3" do
    test "works for empty cellar" do
      assert WineCellar.filter([], :rose) == []
    end

    test "returns all wines of a chosen color" do
      assert WineCellar.filter(@cellar, :white) == [
               {"Chardonnay", 2015, "Italy"},
               {"Chardonnay", 2014, "France"},
               {"Riesling ", 2017, "Germany"},
               {"Pinot grigio", 2015, "Germany"}
             ]

      assert WineCellar.filter(@cellar, :rose) == [{"Dornfelder", 2018, "Germany"}]
    end

    test "filters wines of chosen color by year" do
      assert WineCellar.filter(@cellar, :white, year: 2015) == [
               {"Chardonnay", 2015, "Italy"},
               {"Pinot grigio", 2015, "Germany"}
             ]
    end

    test "filters wines of chosen color by country" do
      assert WineCellar.filter(@cellar, :red, country: "France") == [
               {"Merlot", 2015, "France"},
               {"Pinot noir", 2016, "France"}
             ]
    end

    test "filters wines of chosen color by year and country" do
      assert WineCellar.filter(@cellar, :white, year: 2015, country: "Germany") == [
               {"Pinot grigio", 2015, "Germany"}
             ]
    end

    test "filters wines of chosen color by country and year" do
      assert WineCellar.filter(@cellar, :red, country: "France", year: 2015) == [
               {"Merlot", 2015, "France"}
             ]
    end
  end
end

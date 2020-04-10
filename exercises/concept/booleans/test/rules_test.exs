defmodule RulesTest do
  use ExUnit.Case

  test "if ghost gets eaten" do
    assert Rules.eat_ghost?(true, true)
  end

  @tag :pending # remove line to run test
  test "if ghost does not gets eaten" do
    refute Rules.eat_ghost?(false, true)
  end

  @tag :pending # remove line to run test
  test "if point scored when ate just dot" do
    assert Rules.score?(false, true)
  end

  @tag :pending # remove line to run test
  test "if point scored when ate just pill" do
    assert Rules.score?(true, false)
  end

  @tag :pending # remove line to run test
  test "if point scored when ate pill and dot" do
    assert Rules.score?(true, true)
  end

  @tag :pending # remove line to run test
  test "if point not scored when nothing eaten" do
    refute Rules.score?(false, false)
  end

  @tag :pending # remove line to run test
  test "loss if touched a ghost without a pill" do
    assert Rules.lose?(false, true)
  end

  @tag :pending # remove line to run test
  test "no loss if touched a ghost with a pill" do
    refute Rules.lose?(true, true)
  end

  @tag :pending # remove line to run test
  test "win if all dots eaten" do
    assert Rules.win?(true, false, false)
  end

  @tag :pending # remove line to run test
  test "no win if all dots eaten, but touching a ghose" do
    refute Rules.win?(true, false, true)
  end

  @tag :pending # remove line to run test
  test "win if all dots eaten and touching a ghost if ate a pill" do
    assert Rules.win?(true, true, true)
  end
end

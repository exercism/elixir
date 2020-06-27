defmodule MenschAergereDichNichtTest do
  use ExUnit.Case

  describe "d6/0" do
    # @tag :pending
    test "returns an integer from 1 to 6" do
      assert 1..100
             |> Enum.map(fn _ -> MenschAergereDichNicht.d6() end)
             |> Enum.all?(&(&1 in 1..6))
    end
  end

  describe "roll/0" do
    @tag :pending
    test "returns a stream" do
      assert is_function(MenschAergereDichNicht.roll())
      assert is_list(Enum.to_list(MenschAergereDichNicht.roll()))
    end

    @tag :pending
    test "returns a list of integers" do
      assert [roll | _] = Enum.to_list(MenschAergereDichNicht.roll())
      assert roll in 1..6
    end

    @tag :pending
    test "allows using a rigged die" do
      assert Enum.to_list(MenschAergereDichNicht.roll(fn -> 4 end)) == [4]
    end

    @tag :pending
    test "continues rolling when rolled a 6" do
      {:ok, agent} = Agent.start_link(fn -> [6, 6, 6, 3, 1] end)

      assert Enum.to_list(
               MenschAergereDichNicht.roll(fn ->
                 roll = Agent.get(agent, &hd(&1))
                 Agent.update(agent, &tl(&1))
                 Agent.get(agent, & &1)
                 roll
               end)
             ) == [6, 6, 6, 3]
    end
  end
end

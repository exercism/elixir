defmodule BirdCountTest do
  use ExUnit.Case

  describe "today/1" do
    @tag task_id: 1
    test "returns nil if no bird watching data recorded" do
      assert BirdCount.today([]) == nil
    end

    @tag task_id: 1
    test "returns today's bird count" do
      assert BirdCount.today([5]) == 5
      assert BirdCount.today([2, 4, 11, 10, 6, 8]) == 2
    end
  end

  describe "increment_day_count/1" do
    @tag task_id: 2
    test "creates entry for today if no bird watching data recorded" do
      assert BirdCount.increment_day_count([]) == [1]
    end

    @tag task_id: 2
    test "adds 1 to today's bird count" do
      assert BirdCount.increment_day_count([5]) == [6]
      assert BirdCount.increment_day_count([4, 2, 1, 0, 10]) == [5, 2, 1, 0, 10]
    end
  end

  describe "has_day_without_birds?/1" do
    @tag task_id: 3
    test "false if no bird watching data recorded" do
      assert BirdCount.has_day_without_birds?([]) == false
    end

    @tag task_id: 3
    test "false if there are no zeros in bird watching data" do
      assert BirdCount.has_day_without_birds?([1]) == false
      assert BirdCount.has_day_without_birds?([6, 7, 10, 2, 5]) == false
    end

    @tag task_id: 3
    test "true if there are is at least one zero in bird watching data" do
      assert BirdCount.has_day_without_birds?([0]) == true
      assert BirdCount.has_day_without_birds?([4, 4, 0, 1]) == true
      assert BirdCount.has_day_without_birds?([0, 0, 3, 0, 5, 6, 0]) == true
    end
  end

  describe "total/1" do
    @tag task_id: 4
    test "zero if no bird watching data recorded" do
      assert BirdCount.total([]) == 0
    end

    @tag task_id: 4
    test "sums up bird counts" do
      assert BirdCount.total([4]) == 4
      assert BirdCount.total([3, 0, 0, 4, 4, 0, 0, 10]) == 21
    end
  end

  describe "busy_days/1" do
    @tag task_id: 5
    test "zero if no bird watching data recorded" do
      assert BirdCount.busy_days([]) == 0
    end

    @tag task_id: 5
    test "counts days with bird count of 5 or more" do
      assert BirdCount.busy_days([1]) == 0
      assert BirdCount.busy_days([0, 5]) == 1
      assert BirdCount.busy_days([0, 6, 10, 4, 4, 5, 0]) == 3
    end
  end
end

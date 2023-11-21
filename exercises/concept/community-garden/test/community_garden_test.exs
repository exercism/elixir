defmodule CommunityGardenTest do
  use ExUnit.Case

  @tag task_id: 1
  test "start returns an alive pid" do
    assert {:ok, pid} = CommunityGarden.start()
    assert Process.alive?(pid)
  end

  @tag task_id: 2
  test "when started, the registry is empty" do
    assert {:ok, pid} = CommunityGarden.start()
    assert [] == CommunityGarden.list_registrations(pid)
  end

  @tag task_id: 3
  test "can register a new plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = CommunityGarden.register(pid, "Johnny Appleseed")
  end

  @tag task_id: 3
  test "maintains a registry of plots" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert [plot] == CommunityGarden.list_registrations(pid)
  end

  @tag task_id: 3
  test "the first plot has an id of 1" do
    assert {:ok, pid} = CommunityGarden.start()
    plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert plot.plot_id == 1
  end

  @tag task_id: 3
  test "registered plots have incremental unique id" do
    assert {:ok, pid} = CommunityGarden.start()
    plot_1 = CommunityGarden.register(pid, "Johnny Appleseed")
    plot_2 = CommunityGarden.register(pid, "Frederick Law Olmsted")
    plot_3 = CommunityGarden.register(pid, "Lancelot (Capability) Brown")

    assert plot_1.plot_id == 1
    assert plot_2.plot_id == 2
    assert plot_3.plot_id == 3
  end

  @tag task_id: 3
  test "registered plots have incremental unique id when registered concurrently" do
    {:ok, pid} = CommunityGarden.start()

    total_plots = 20
    test_process_pid = self()

    Enum.each(1..total_plots, fn n ->
      spawn(fn ->
        plot = CommunityGarden.register(pid, "Mary Bumblebee #{n}")
        send(test_process_pid, {n, plot})
      end)
    end)

    plot_ids =
      Enum.map(1..total_plots, fn n ->
        receive do
          {^n, plot} -> plot.plot_id
        after
          100 -> nil
        end
      end)

    assert Enum.sort(plot_ids) == Enum.to_list(1..total_plots)
  end

  @tag task_id: 4
  test "can release a plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert :ok = CommunityGarden.release(pid, plot.plot_id)
    assert [] == CommunityGarden.list_registrations(pid)
  end

  @tag task_id: 4
  test "do not re-use id of released plots" do
    assert {:ok, pid} = CommunityGarden.start()

    plot_1 = CommunityGarden.register(pid, "Keanu Reeves")
    plot_2 = CommunityGarden.register(pid, "Thomas A. Anderson")

    assert plot_1.plot_id == 1
    assert plot_2.plot_id == 2

    CommunityGarden.release(pid, plot_1.plot_id)
    CommunityGarden.release(pid, plot_2.plot_id)

    plot_3 = CommunityGarden.register(pid, "John Doe")
    plot_4 = CommunityGarden.register(pid, "Jane Doe")

    assert plot_3.plot_id == 3
    assert plot_4.plot_id == 4
  end

  @tag task_id: 4
  test "release only one plot at time" do
    assert {:ok, pid} = CommunityGarden.start()

    plot_1 = CommunityGarden.register(pid, "Keanu Reeves")
    plot_2 = CommunityGarden.register(pid, "Thomas A. Anderson")

    assert plot_1.plot_id == 1
    assert plot_2.plot_id == 2

    CommunityGarden.release(pid, plot_1.plot_id)

    assert [^plot_2] = CommunityGarden.list_registrations(pid)
  end

  @tag task_id: 5
  test "can get registration of a registered plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert %Plot{} = registered_plot = CommunityGarden.get_registration(pid, plot.plot_id)
    assert registered_plot.plot_id == plot.plot_id
    assert registered_plot.registered_to == "Johnny Appleseed"
  end

  @tag task_id: 5
  test "return not_found when attempt to get registration of an unregistered plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert {:not_found, "plot is unregistered"} = CommunityGarden.get_registration(pid, 1)
  end
end

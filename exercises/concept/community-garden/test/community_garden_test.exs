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
  test "registered plots have unique id" do
    assert {:ok, pid} = CommunityGarden.start()
    CommunityGarden.register(pid, "Johnny Appleseed")
    CommunityGarden.register(pid, "Frederick Law Olmsted")
    CommunityGarden.register(pid, "Lancelot (Capability) Brown")

    plots = pid |> CommunityGarden.list_registrations()
    unique_ids = plots |> Enum.map(& &1.plot_id) |> Enum.uniq()
    assert length(plots) == length(unique_ids)
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

    ids = CommunityGarden.list_registrations(pid) |> Enum.map(& &1.plot_id)

    CommunityGarden.release(pid, plot_1.plot_id)
    CommunityGarden.release(pid, plot_2.plot_id)

    CommunityGarden.register(pid, "John Doe")
    CommunityGarden.register(pid, "Jane Doe")

    new_ids = CommunityGarden.list_registrations(pid) |> Enum.map(& &1.plot_id)

    refute Enum.sort(ids) == Enum.sort(new_ids)
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

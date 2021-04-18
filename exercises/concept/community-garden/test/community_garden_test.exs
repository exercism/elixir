defmodule CommunityGardenTest do
  use ExUnit.Case

  test "start returns an alive pid" do
    assert {:ok, pid} = CommunityGarden.start()
    assert Process.alive?(pid)
  end

  test "when started, the registry is empty" do
    assert {:ok, pid} = CommunityGarden.start()
    assert [] == CommunityGarden.list_registrations(pid)
  end

  test "can register a new plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = CommunityGarden.register(pid, "Johnny Appleseed")
  end

  test "maintains a registry of plots" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert [plot] == CommunityGarden.list_registrations(pid)
  end

  test "can release a plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert :ok = CommunityGarden.release(pid, plot.plot_id)
    assert [] == CommunityGarden.list_registrations(pid)
  end

  test "can get a specific registration by id" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert "Johnny Appleseed" = CommunityGarden.get_registration(pid, plot.plot_id).registered_to
  end

  test "can get registration of a registered plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert %Plot{} = plot = CommunityGarden.register(pid, "Johnny Appleseed")
    assert %Plot{} = registered_plot = CommunityGarden.get_registration(pid, plot.plot_id)
    assert registered_plot.plot_id == plot.plot_id
    assert registered_plot.registered_to == "Johnny Appleseed"
  end

  test "return not_found when attempt to get registration of an unregistered plot" do
    assert {:ok, pid} = CommunityGarden.start()
    assert {:not_found, "plot is unregistered"} = CommunityGarden.get_registration(pid, 1)
  end
end

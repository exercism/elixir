# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts) do
    # Please implement the start/1 function
  end

  def list_registrations(pid) do
    # Please implement the list_registrations/1 function
  end

  def register(pid, register_to) do
    # Please implement the register/2 function
  end

  def release(pid, plot_id) do
    # Please implement the release/2 function
  end

  def get_registration(pid, plot_id) do
    # Please implement the get_registration/2 function
  end
end

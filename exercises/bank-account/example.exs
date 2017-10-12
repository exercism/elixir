defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  use GenServer

  ## Callbacks

  def init(_args) do
    {:ok, 0}
  end

  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end

  def handle_call({:update, amount}, _from, balance) do
    {:reply, :ok, balance + amount}
  end

  def handle_call(:close, _from, balance) do
    # We stop normally and return :stopped to the caller.
    {:stop, :normal, :stopped, balance}
  end

  ## Interface for tests

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, pid} = GenServer.start_link(__MODULE__, [], [])
    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: any
  def close_bank(account) do
    GenServer.stop(account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    if Process.alive?(account) do
      GenServer.call(account, :balance)
    else
      {:error, :account_closed}
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  def update(account, amount) do
    if Process.alive?(account) do
      GenServer.call(account, {:update, amount})
    else
      {:error, :account_closed}
    end
  end
end

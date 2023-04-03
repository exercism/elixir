defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  use GenServer

  ## Callbacks

  @impl true
  def init(_args) do
    {:ok, 0}
  end

  @impl true
  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end

  @impl true
  def handle_call({:deposit, amount}, _from, balance) do
    if amount <= 0 do
      {:reply, {:error, :amount_must_be_positive}, balance}
    else
      {:reply, :ok, balance + amount}
    end
  end

  @impl true
  def handle_call({:withdraw, amount}, _from, balance) do
    cond do
      amount <= 0 ->
        {:reply, {:error, :amount_must_be_positive}, balance}

      balance < amount ->
        {:reply, {:error, :not_enough_balance}, balance}

      true ->
        {:reply, :ok, balance - amount}
    end
  end

  @impl true
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
  Open the bank account, making it available for further operations.
  """
  @spec open() :: account
  def open() do
    {:ok, pid} = GenServer.start_link(__MODULE__, [], [])
    pid
  end

  @doc """
  Close the bank account, making it unavailable for further operations.
  """
  @spec close(account) :: any
  def close(account) do
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
  Add the given amount to the account's balance.
  """
  @spec deposit(account, integer) :: :ok | {:error, :account_closed | :amount_must_be_positive}
  def deposit(account, amount) do
    if Process.alive?(account) do
      GenServer.call(account, {:deposit, amount})
    else
      {:error, :account_closed}
    end
  end

  @doc """
  Subtract the given amount from the account's balance.
  """
  @spec withdraw(account, integer) ::
          :ok | {:error, :account_closed | :amount_must_be_positive | :not_enough_balance}
  def withdraw(account, amount) do
    if Process.alive?(account) do
      GenServer.call(account, {:withdraw, amount})
    else
      {:error, :account_closed}
    end
  end
end

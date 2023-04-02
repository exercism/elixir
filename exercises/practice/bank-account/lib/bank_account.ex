defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank account, making it available for further operations.
  """
  @spec open() :: account
  def open() do
  end

  @doc """
  Close the bank account, making it unavailable for further operations.
  """
  @spec close(account) :: any
  def close(account) do
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
  end

  @doc """
  Add the given positive amount to the account's balance.
  """
  def deposit(account, amount) do
  end

  @doc """
  Subtract the given positive amount from the account's balance.
  """
  def withdraw(account, amount) do
  end
end

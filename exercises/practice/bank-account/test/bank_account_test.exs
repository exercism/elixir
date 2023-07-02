defmodule BankAccountTest do
  use ExUnit.Case

  setup do
    account = BankAccount.open()
    {:ok, account: account}
  end

  # @tag :pending
  test "newly opened account has zero balance", %{account: account} do
    assert BankAccount.balance(account) == 0
  end

  @tag :pending
  test "single deposit", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, 100) == :ok
    assert BankAccount.balance(account) == 100
  end

  @tag :pending
  test "multiple deposits", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, 100) == :ok
    assert BankAccount.deposit(account, 50) == :ok
    assert BankAccount.balance(account) == 150
  end

  @tag :pending
  test "withdraw once", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, 100) == :ok
    assert BankAccount.withdraw(account, 75) == :ok
    assert BankAccount.balance(account) == 25
  end

  @tag :pending
  test "withdraw twice", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, 100) == :ok
    assert BankAccount.withdraw(account, 80) == :ok
    assert BankAccount.withdraw(account, 20) == :ok
    assert BankAccount.balance(account) == 0
  end

  @tag :pending
  test "can do multiple operations sequentially", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, 100) == :ok
    assert BankAccount.deposit(account, 110) == :ok
    assert BankAccount.withdraw(account, 200) == :ok
    assert BankAccount.deposit(account, 60) == :ok
    assert BankAccount.withdraw(account, 50) == :ok
    assert BankAccount.balance(account) == 20
  end

  @tag :pending
  test "cannot check balance of closed account", %{account: account} do
    assert BankAccount.balance(account) == 0
    BankAccount.close(account)
    assert BankAccount.balance(account) == {:error, :account_closed}
  end

  @tag :pending
  test "cannot deposit into closed account", %{account: account} do
    assert BankAccount.balance(account) == 0
    BankAccount.close(account)
    assert BankAccount.deposit(account, 50) == {:error, :account_closed}
  end

  @tag :pending
  test "cannot withdraw from closed account", %{account: account} do
    assert BankAccount.balance(account) == 0
    BankAccount.close(account)
    assert BankAccount.withdraw(account, 50) == {:error, :account_closed}
  end

  @tag :pending
  test "cannot withdraw more than deposited", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, 25) == :ok
    assert BankAccount.withdraw(account, 50) == {:error, :not_enough_balance}
  end

  @tag :pending
  test "cannot withdraw negative", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, 100) == :ok
    assert BankAccount.withdraw(account, -50) == {:error, :amount_must_be_positive}
  end

  @tag :pending
  test "cannot deposit negative", %{account: account} do
    assert BankAccount.balance(account) == 0
    assert BankAccount.deposit(account, -50) == {:error, :amount_must_be_positive}
  end

  @tag :pending
  test "can handle concurrent transactions", %{account: account} do
    assert BankAccount.balance(account) == 0

    0..999
    |> Enum.map(fn _ ->
      Task.async(fn ->
        :timer.sleep(Enum.random(0..20))
        :ok = BankAccount.deposit(account, 1)
      end)
    end)
    |> Enum.map(fn task -> Task.await(task, 1000) end)

    assert BankAccount.balance(account) == 1000
  end

  @tag :pending
  test "incrementing balance from another process then checking it from test process", %{
    account: account
  } do
    assert BankAccount.balance(account) == 0
    this = self()

    spawn(fn ->
      :ok = BankAccount.deposit(account, 20)
      send(this, :continue)
    end)

    receive do
      :continue -> :ok
    after
      1000 -> flunk("Timeout")
    end

    assert BankAccount.balance(account) == 20
  end

  @tag :pending
  test "implementation for multiple account support", %{account: account} do
    assert is_pid(account)

    account_two = BankAccount.open()
    assert is_pid(account_two)

    assert account != account_two

    assert BankAccount.deposit(account, 20) == :ok
    assert BankAccount.balance(account) != BankAccount.balance(account_two)
  end
end

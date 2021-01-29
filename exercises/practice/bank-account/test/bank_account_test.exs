defmodule BankAccountTest do
  use ExUnit.Case

  setup do
    account = BankAccount.open_bank()
    {:ok, account: account}
  end

  # @tag :pending
  test "initial balance is 0", %{account: account} do
    assert BankAccount.balance(account) == 0
  end

  @tag :pending
  test "incrementing and checking balance", %{account: account} do
    assert BankAccount.balance(account) == 0
    BankAccount.update(account, 10)
    assert BankAccount.balance(account) == 10
  end

  @tag :pending
  test "amount is added to balance", %{account: account} do
    assert BankAccount.balance(account) == 0
    BankAccount.update(account, 10)
    BankAccount.update(account, 10)
    assert BankAccount.balance(account) == 20
  end

  @tag :pending
  test "closing account rejects further inquiries", %{account: account} do
    assert BankAccount.balance(account) == 0
    BankAccount.close_bank(account)
    assert BankAccount.balance(account) == {:error, :account_closed}
    assert BankAccount.update(account, 10) == {:error, :account_closed}
  end

  @tag :pending
  test "incrementing balance from another process then checking it from test process", %{
    account: account
  } do
    assert BankAccount.balance(account) == 0
    this = self()

    spawn(fn ->
      BankAccount.update(account, 20)
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

    account_two = BankAccount.open_bank()
    assert is_pid(account_two)

    assert account != account_two

    BankAccount.update(account, 20)
    assert BankAccount.balance(account) != BankAccount.balance(account_two)
  end
end

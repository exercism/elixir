Code.load_file("../file_loader.ex", __DIR__)
FileLoader.load("account", __DIR__)

# The BankAccount module should support four calls:
#
# open_bank()
#   Called at the start of each test. Returns an account handle.
#
# close_bank(account)
#   Called at the end of each test.
#
# balance(account)
#   Get the balance of the bank account.
#
# update(account, amount)
#   Increment the balance of the bank account by the given amount.
#   The amount may be negative for a withdrawal.
#
# The initial value of the bank account should be 0.

defmodule BankAccountTest do
  use ExUnit.Case, async: false # Tests should not overlap in execution.

  setup do
    account = BankAccount.open_bank()
    { :ok, [ account: account ] }
  end

  # @tag :pending
  test "initial balance is 0", context do
    assert BankAccount.balance(context[:account]) == 0
  end

  @tag :pending
  test "incrementing and checking balance", context do
    assert BankAccount.balance(context[:account]) == 0
    BankAccount.update(context[:account], 10)
    assert BankAccount.balance(context[:account]) == 10
  end

  @tag :pending
  test "incrementing balance from another process then checking it from test process", context do
    assert BankAccount.balance(context[:account]) == 0
    this = self()
    spawn(fn ->
      BankAccount.update(context[:account], 20)
      send(this, :continue)
    end)
    receive do
      :continue -> :ok
    after
      1000 -> flunk("Timeout")
    end
    assert BankAccount.balance(context[:account]) == 20
  end
end

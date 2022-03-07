defmodule TakeANumberTest do
  use ExUnit.Case

  @tag task_id: 1
  test "starts a new process" do
    pid = TakeANumber.start()
    assert is_pid(pid)
    assert pid != self()
    assert pid != TakeANumber.start()
  end

  @tag task_id: 2
  test "reports its own state" do
    pid = TakeANumber.start()
    send(pid, {:report_state, self()})
    assert_receive 0
  end

  @tag task_id: 2
  test "does not shut down after reporting its own state" do
    pid = TakeANumber.start()
    send(pid, {:report_state, self()})
    assert_receive 0

    send(pid, {:report_state, self()})
    assert_receive 0
  end

  @tag task_id: 3
  test "gives out a number" do
    pid = TakeANumber.start()
    send(pid, {:take_a_number, self()})
    assert_receive 1
  end

  @tag task_id: 3
  test "gives out many consecutive numbers" do
    pid = TakeANumber.start()
    send(pid, {:take_a_number, self()})
    assert_receive 1

    send(pid, {:take_a_number, self()})
    assert_receive 2

    send(pid, {:take_a_number, self()})
    assert_receive 3

    send(pid, {:report_state, self()})
    assert_receive 3

    send(pid, {:take_a_number, self()})
    assert_receive 4

    send(pid, {:take_a_number, self()})
    assert_receive 5

    send(pid, {:report_state, self()})
    assert_receive 5
  end

  @tag task_id: 4
  test "stops" do
    pid = TakeANumber.start()
    assert Process.alive?(pid)
    send(pid, {:report_state, self()})
    assert_receive 0

    send(pid, :stop)
    send(pid, {:report_state, self()})
    refute_receive 0
    refute Process.alive?(pid)
  end

  @tag task_id: 5
  test "ignores unexpected messages and keeps working" do
    pid = TakeANumber.start()

    send(pid, :hello?)
    send(pid, "I want to speak with the manager")

    send(pid, {:take_a_number, self()})
    assert_receive 1

    send(pid, {:report_state, self()})
    assert_receive 1

    # wait_until/3 is a custom helper function that tries to
    # evaluate the given expression a few times until it returns true.
    # This is necessary because `Process.info/1` is not guaranteed to return up-to-date info immediately.

    # Do not use `Process.info/1` in your own code.
    # It's meant for debugging purposes only.
    # We use it here for didactic purposes because there is no alternative that would achieve the same result.
    assert wait_until(fn ->
             Keyword.get(Process.info(pid), :message_queue_len) == 0
           end)
  end

  defp wait_until(condition_fn, max_retries \\ 5, current_try \\ 1) do
    condition_fn_return = condition_fn.()

    cond do
      condition_fn_return == true ->
        true

      max_retries > current_try ->
        :timer.sleep(100) && wait_until(condition_fn, max_retries, current_try + 1)

      max_retries <= current_try ->
        condition_fn_return
    end
  end
end

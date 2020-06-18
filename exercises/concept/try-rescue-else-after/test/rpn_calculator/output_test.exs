defmodule RPNCalculator.OutputTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  @resource __MODULE__
  @filename "filename"
  @bad_filename "bad_filename"
  @equation "1 1 +"

  def open(filename \\ "<nil>") do
    send(self(), {:open, filename})

    case filename do
      @filename -> {:ok, :stdio}
      @bad_filename -> {:ok, spawn fn -> nil end}
    end
  end

  def close(_) do
    send(self(), :close)
    :ok
  end

  describe "write/3" do
    # @tag :pending
    test "returns ok tuple if function succeeds" do
      assert {:ok, @equation} == RPNCalculator.Output.write(@resource, @filename, @equation)
    end

    @tag :pending
    @use_open_error_message """
      Use the open/1 function from the `resource` specified in the arguments to open `filename`.

      E.g.) resource.open(filename)
      """
    test "opens resource" do
      RPNCalculator.Output.write(@resource, @filename, @equation)
      assert_received {:open, @filename}, @use_open_error_message
    end

    @tag :pending
    @use_write_error_message """
      Use IO.write/2 to write to the opened `filename`.
      """
    test "writes to resource" do
      assert capture_io(fn -> RPNCalculator.Output.write(@resource, @filename, @equation) end) == "1 1 +", @use_write_error_message
    end

    @tag :pending
    @use_close_error_message """
      Use the close/1 function from the `resource` specified in the arguments to close the opened file handle.

      E.g.) resource.close(filename)
      """
    test "closes resource" do
      RPNCalculator.Output.write(__MODULE__, @filename, @equation)
      assert_received :close, @use_close_error_message
    end

    @tag :pending
    test "rescues and returns error tuple from raised error" do
      assert {:error, "Unable to write to resource"} == RPNCalculator.Output.write(@resource, @bad_filename, @equation)
    end

    @tag :pending
    test "closes resource even when rescuing from raised error" do
      RPNCalculator.Output.write(@resource, @bad_filename, @equation)
      assert_received :close, "write/3 should close the `resource` even if an error is raised"
    end
  end
end

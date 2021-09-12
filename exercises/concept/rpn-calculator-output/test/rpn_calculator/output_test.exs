defmodule RPNCalculator.OutputTest do
  use ExUnit.Case

  setup do
    on_exit(fn -> File.rm("filename") end)
  end

  def open(filename \\ "<nil>") do
    send(self(), {:open, filename})

    case filename do
      "filename" -> File.open(filename, [:write])
      "bad_filename" -> {:ok, spawn(fn -> nil end)}
    end
  end

  def close(file) do
    send(self(), :close)
    File.close(file)
  end

  describe "write/3" do
    @tag task_id: 1
    test "returns ok tuple if function succeeds" do
      resource = __MODULE__
      filename = "filename"
      equation = "1 1 +"

      assert {:ok, equation} == RPNCalculator.Output.write(resource, filename, equation)
    end

    @use_open_error_message """
    Use the open/1 function from the `resource` specified in the arguments to open `filename`.

    E.g.) resource.open(filename)
    """
    @tag task_id: 1
    test "opens resource" do
      resource = __MODULE__
      filename = "filename"
      equation = "1 1 +"

      RPNCalculator.Output.write(resource, filename, equation)
      assert_received {:open, ^filename}, @use_open_error_message
    end

    @use_write_error_message """
    Use IO.write/2 to write to the opened `filename`.
    """
    @tag task_id: 2
    test "writes to resource" do
      resource = __MODULE__
      filename = "filename"
      equation = "1 1 +"
      {:ok, ^equation} = RPNCalculator.Output.write(resource, filename, equation)

      assert File.read!(filename) == "1 1 +", @use_write_error_message
    end

    @tag task_id: 2
    test "rescues and returns error tuple from raised error" do
      resource = __MODULE__
      bad_filename = "bad_filename"
      equation = "1 1 +"

      assert {:error, "Unable to write to resource"} ==
               RPNCalculator.Output.write(resource, bad_filename, equation)
    end

    @use_close_error_message """
    Use the close/1 function from the `resource` specified in the arguments to close the opened file handle.

    E.g.) resource.close(filename)
    """
    @tag task_id: 3
    test "closes resource" do
      resource = __MODULE__
      filename = "filename"
      equation = "1 1 +"

      RPNCalculator.Output.write(resource, filename, equation)
      assert_received :close, @use_close_error_message
    end

    @tag task_id: 3
    test "closes resource even when rescuing from raised error" do
      resource = __MODULE__
      bad_filename = "bad_filename"
      equation = "1 1 +"

      RPNCalculator.Output.write(resource, bad_filename, equation)
      assert_received :close, "write/3 should close the `resource` even if an error is raised"
    end
  end
end

defmodule LogLevelTest do
  use ExUnit.Case

  describe "LogLevel.to_label/1" do
    # @tag :pending
    test "label trace" do
      assert LogLevel.to_label(0) == :trace
    end

    @tag :pending
    test "label debug" do
      assert LogLevel.to_label(1) == :debug
    end

    @tag :pending
    test "label info" do
      assert LogLevel.to_label(4) == :info
    end

    @tag :pending
    test "label warning" do
      assert LogLevel.to_label(5) == :warning
    end

    @tag :pending
    test "label error" do
      assert LogLevel.to_label(6) == :error
    end

    @tag :pending
    test "label fatal" do
      assert LogLevel.to_label(7) == :fatal
    end

    @tag :pending
    test "label unknown" do
      assert LogLevel.to_label(10) == :unknown
    end

    @tag :pending
    test "label another unknown" do
      assert LogLevel.to_label(-1) == :unknown
    end
  end

  describe "LogLevel.send_alert?/1" do
    @tag :pending
    test "if :fatal code sends alert" do
      assert LogLevel.send_alert?(7)
    end

    @tag :pending
    test "if :error code sends alert" do
      assert LogLevel.send_alert?(6)
    end

    @tag :pending
    test "if :unknown code sends alert" do
      assert LogLevel.send_alert?(10)
    end

    @tag :pending
    test "if :trace code does not send alert" do
      refute LogLevel.send_alert?(0)
    end

    @tag :pending
    test "if :debug code does not send alert" do
      refute LogLevel.send_alert?(1)
    end

    @tag :pending
    test "if :info code does not send alert" do
      refute LogLevel.send_alert?(4)
    end

    @tag :pending
    test "if :warning code does not send alert" do
      refute LogLevel.send_alert?(5)
    end
  end
end

defmodule LogLevel do
  def to_label(level) do
    raise "Please implement the to_label/1 function"
  end

  def send_alert?(level) do
    raise "Please implement the send_alert?/1 function"
  end
end

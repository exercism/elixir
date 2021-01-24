defmodule LogLevel do
  def to_label(level, legacy?) do
    raise "Please implement the to_label/2 function"
  end

  def alert_recipient?(level, legacy?) do
    raise "Please implement the alert_recipient/2 function"
  end
end

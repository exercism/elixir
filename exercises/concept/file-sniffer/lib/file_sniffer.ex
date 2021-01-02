defmodule FileSniffer do
  def type_from_extension(extension) do
    raise "Please implement the type_from_extension/1 function"
  end

  def type_from_binary(file_binary) do
    raise "Please implement the type_from_binary/1 function"
  end

  def verify(file_binary, extension) do
    raise "Please implement the verify/2 function"
  end
end

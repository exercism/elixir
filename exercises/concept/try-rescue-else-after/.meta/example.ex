defmodule RPNCalculator.Output do
  def write(resource, filename, equation) do
    {:ok, file} = resource.open(filename)

    try do
      IO.write(file, equation)
    rescue
      _ -> {:error, "Unable to write to resource"}
    else
      :ok -> {:ok, equation}
    after
      resource.close(file)
    end
  end
end

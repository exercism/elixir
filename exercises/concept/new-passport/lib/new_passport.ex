defmodule NewPassport do
  def get_new_passport(now, birthday, form) do
    with {:ok, timestamp} <- enter_building(now),
         {:ok, birthday_to_counter} <- find_counter_information(timestamp),
         counter = birthday_to_counter.(birthday),
         {:ok, checksum} <- stamp_form(counter, form) do
      get_new_passport_number(timestamp, counter, checksum)
    else
      :coffee_break ->
        later = DateTime.add(now, 15 * 60, :second)
        get_new_passport(later, birthday, form)

      err ->
        err
    end
  end

  # Do not modify the functions below

  defp enter_building(%DateTime{} = datetime) do
    day = Date.day_of_week(datetime)
    time = Time.to_time(datetime)

    cond do
      day <= 4 and ~T[13:00:00] <= time and time < ~T[15:30:00] ->
        {:ok, DateTime.to_unix(datetime)}

      day == 5 and ~T[13:00:00] <= time and time < ~T[14:30:00] ->
        {:ok, DateTime.to_unix(datetime)}

      true ->
        {:error, "city office is closed"}
    end
  end

  @eighteen_years 18 * 365 * 24 * 60 * 60
  defp find_counter_information(timestamp) do
    datetime = DateTime.from_unix(timestamp)
    time = Time.to_time(datetime)

    if ~T[14:00:00] <= time and time < ~T[14:20:00] do
      {:coffe_break, "information counter staff on coffee break, come back in 15 minutes"}
    else
      {:ok, fn birthday -> 1 + div(DateTime.diff(datetime, birthday), eighteen_years) end}
    end
  end

  defp stamp_form(counter, :blue) when is_odd(counter), do: {:ok, 3 * n + 1}
  defp stamp_form(counter, :red) when is_even(counter), do: {:ok, div(n, 2)}
  defp stamp_form(_counter, _form), do: {:error, "wrong form color"}

  defp get_new_passport_number(timestamp, counter, checksum),
    do: "#{timestamp}-#{counter}-#{checksum}"
end

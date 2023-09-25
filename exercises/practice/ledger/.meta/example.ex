defmodule Ledger do
  @doc """
  Format the given entries given a currency and locale
  """
  @type currency :: :usd | :eur
  @type locale :: :en_US | :nl_NL
  @type entry :: %{amount_in_cents: integer(), date: Date.t(), description: String.t()}

  @spec format_entries(currency(), locale(), list(entry())) :: String.t()
  def format_entries(currency, locale, entries) do
    header = header(locale)

    entries =
      entries
      |> Enum.sort(&compare_entries/2)
      |> Enum.map(fn entry -> format_entry(currency, locale, entry) end)

    Enum.join([header | entries], "\n") <> "\n"
  end

  defp header(:en_US), do: "Date       | Description               | Change       "
  defp header(:nl_NL), do: "Datum      | Omschrijving              | Verandering  "

  defp compare_entries(a, b) do
    case Date.compare(a.date, b.date) do
      :lt ->
        true

      :gt ->
        false

      :eq ->
        cond do
          a.description < b.description -> true
          a.description > b.description -> false
          true -> a.amount_in_cents <= b.amount_in_cents
        end
    end
  end

  @description_width 25
  @amount_width 13
  defp format_entry(currency, locale, %{
         amount_in_cents: amount,
         date: date,
         description: description
       }) do
    date = format_date(date, locale)

    amount =
      amount
      |> format_amount(currency, locale)
      |> String.pad_leading(@amount_width, " ")

    description =
      if String.length(description) > @description_width do
        String.slice(description, 0, @description_width - 3) <> "..."
      else
        String.pad_trailing(description, @description_width, " ")
      end

    Enum.join([date, description, amount], " | ")
  end

  defp format_date(date, :en_US) do
    year = date.year
    month = date.month |> to_string() |> String.pad_leading(2, "0")
    day = date.day |> to_string() |> String.pad_leading(2, "0")
    Enum.join([month, day, year], "/")
  end

  defp format_date(date, :nl_NL) do
    year = date.year
    month = date.month |> to_string() |> String.pad_leading(2, "0")
    day = date.day |> to_string() |> String.pad_leading(2, "0")
    Enum.join([day, month, year], "-")
  end

  defp format_amount(amount, currency, :en_US) do
    currency = format_currency(currency)
    number = format_number(abs(amount), ".", ",")

    if amount >= 0 do
      " #{currency}#{number} "
    else
      "(#{currency}#{number})"
    end
  end

  defp format_amount(amount, currency, :nl_NL) do
    currency = format_currency(currency)
    number = format_number(abs(amount), ",", ".")

    if amount >= 0 do
      "#{currency} #{number} "
    else
      "#{currency} -#{number} "
    end
  end

  defp format_currency(:usd), do: "$"
  defp format_currency(:eur), do: "€"

  defp format_number(number, decimal_separator, thousand_separator) do
    decimal = number |> rem(100) |> to_string() |> String.pad_leading(2, "0")
    whole = number |> div(100) |> to_string() |> chunk() |> Enum.join(thousand_separator)
    whole <> decimal_separator <> decimal
  end

  defp chunk(number) do
    case String.length(number) do
      0 ->
        []

      n when n < 3 ->
        [number]

      n when rem(n, 3) == 0 ->
        {chunk, rest} = String.split_at(number, 3)
        [chunk | chunk(rest)]

      n ->
        {chunk, rest} = String.split_at(number, rem(n, 3))
        [chunk | chunk(rest)]
    end
  end
end

defmodule Ledger do
  @doc """
  Format the given entries given a currency and locale
  """
  @type currency :: :usd | :eur
  @type locale :: :en_US | :nl_NL
  @type entry :: %{amount_in_cents: integer(), date: Date.t(), description: String.t()}

  @spec format_entries(currency(), locale(), list(entry())) :: String.t()
  def format_entries(currency, locale, entries) do
    header =
      if locale == :en_US do
        "Date       | Description               | Change       \n"
      else
        "Datum      | Omschrijving              | Verandering  \n"
      end

    if entries == [] do
      header
    else
      entries =
        Enum.sort(entries, fn a, b ->
          cond do
            a.date.day < b.date.day -> true
            a.date.day > b.date.day -> false
            a.description < b.description -> true
            a.description > b.description -> false
            true -> a.amount_in_cents <= b.amount_in_cents
          end
        end)
        |> Enum.map(fn entry -> format_entry(currency, locale, entry) end)
        |> Enum.join("\n")

      header <> entries <> "\n"
    end
  end

  defp format_entry(currency, locale, entry) do
    year = entry.date.year |> to_string()
    month = entry.date.month |> to_string() |> String.pad_leading(2, "0")
    day = entry.date.day |> to_string() |> String.pad_leading(2, "0")

    date =
      if locale == :en_US do
        month <> "/" <> day <> "/" <> year <> " "
      else
        day <> "-" <> month <> "-" <> year <> " "
      end

    number =
      if locale == :en_US do
        decimal =
          entry.amount_in_cents |> abs |> rem(100) |> to_string() |> String.pad_leading(2, "0")

        whole =
          if abs(div(entry.amount_in_cents, 100)) < 1000 do
            abs(div(entry.amount_in_cents, 100)) |> to_string()
          else
            to_string(div(abs(div(entry.amount_in_cents, 100)), 1000)) <>
              "," <> to_string(rem(abs(div(entry.amount_in_cents, 100)), 1000))
          end

        whole <> "." <> decimal
      else
        decimal =
          entry.amount_in_cents |> abs |> rem(100) |> to_string() |> String.pad_leading(2, "0")

        whole =
          if abs(div(entry.amount_in_cents, 100)) < 1000 do
            abs(div(entry.amount_in_cents, 100)) |> to_string()
          else
            to_string(div(abs(div(entry.amount_in_cents, 100)), 1000)) <>
              "." <> to_string(rem(abs(div(entry.amount_in_cents, 100)), 1000))
          end

        whole <> "," <> decimal
      end

    amount =
      if entry.amount_in_cents >= 0 do
        if locale == :en_US do
          "  #{if(currency == :eur, do: "€", else: "$")}#{number} "
        else
          " #{if(currency == :eur, do: "€", else: "$")} #{number} "
        end
      else
        if locale == :en_US do
          " (#{if(currency == :eur, do: "€", else: "$")}#{number})"
        else
          " #{if(currency == :eur, do: "€", else: "$")} -#{number} "
        end
      end
      |> String.pad_leading(14, " ")

    description =
      if entry.description |> String.length() > 26 do
        " " <> String.slice(entry.description, 0, 22) <> "..."
      else
        " " <> String.pad_trailing(entry.description, 25, " ")
      end

    date <> "|" <> description <> " |" <> amount
  end
end

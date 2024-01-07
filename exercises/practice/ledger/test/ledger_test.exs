defmodule LedgerTest do
  use ExUnit.Case

  # @tag :pending
  test "empty ledger" do
    assert Ledger.format_entries(:usd, :en_US, []) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             """
  end

  @tag :pending
  test "one entry" do
    entries = [
      %{amount_in_cents: -1000, date: ~D[2015-01-01], description: "Buy present"}
    ]

    assert Ledger.format_entries(:usd, :en_US, entries) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             01/01/2015 | Buy present               |      ($10.00)
             """
  end

  @tag :pending
  test "credit and debit" do
    entries = [
      %{amount_in_cents: 1000, date: ~D[2015-01-02], description: "Get present"},
      %{amount_in_cents: -1000, date: ~D[2015-01-01], description: "Buy present"}
    ]

    assert Ledger.format_entries(:usd, :en_US, entries) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             01/01/2015 | Buy present               |      ($10.00)
             01/02/2015 | Get present               |       $10.00\s
             """
  end

  @tag :pending
  test "multiple entries on same date ordered by description" do
    entries = [
      %{amount_in_cents: 1000, date: ~D[2015-01-01], description: "Get present"},
      %{amount_in_cents: -1000, date: ~D[2015-01-01], description: "Buy present"}
    ]

    assert Ledger.format_entries(:usd, :en_US, entries) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             01/01/2015 | Buy present               |      ($10.00)
             01/01/2015 | Get present               |       $10.00\s
             """
  end

  @tag :pending
  test "final order tie breaker is change" do
    entries = [
      %{amount_in_cents: 0, date: ~D[2015-01-01], description: "Something"},
      %{amount_in_cents: -1, date: ~D[2015-01-01], description: "Something"},
      %{amount_in_cents: 1, date: ~D[2015-01-01], description: "Something"}
    ]

    assert Ledger.format_entries(:usd, :en_US, entries) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             01/01/2015 | Something                 |       ($0.01)
             01/01/2015 | Something                 |        $0.00\s
             01/01/2015 | Something                 |        $0.01\s
             """
  end

  @tag :pending
  test "overlong description is truncated" do
    entries = [
      %{
        amount_in_cents: -123_456,
        date: ~D[2015-01-01],
        description: "Freude schoner Gotterfunken"
      }
    ]

    assert Ledger.format_entries(:usd, :en_US, entries) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             01/01/2015 | Freude schoner Gotterf... |   ($1,234.56)
             """
  end

  @tag :pending
  test "euros" do
    entries = [
      %{amount_in_cents: -1000, date: ~D[2015-01-01], description: "Buy present"}
    ]

    assert Ledger.format_entries(:eur, :en_US, entries) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             01/01/2015 | Buy present               |      (€10.00)
             """
  end

  @tag :pending
  test "Dutch locale" do
    entries = [
      %{amount_in_cents: 123_456, date: ~D[2015-03-12], description: "Buy present"}
    ]

    assert Ledger.format_entries(:usd, :nl_NL, entries) ==
             """
             Datum      | Omschrijving              | Verandering\s\s
             12-03-2015 | Buy present               |   $ 1.234,56\s
             """
  end

  @tag :pending
  test "Dutch locale and euros" do
    entries = [
      %{amount_in_cents: 123_456, date: ~D[2015-03-12], description: "Buy present"}
    ]

    assert Ledger.format_entries(:eur, :nl_NL, entries) ==
             """
             Datum      | Omschrijving              | Verandering\s\s
             12-03-2015 | Buy present               |   € 1.234,56\s
             """
  end

  @tag :pending
  test "Dutch negative number with 3 digits before decimal point" do
    entries = [
      %{amount_in_cents: -12345, date: ~D[2015-03-12], description: "Buy present"}
    ]

    assert Ledger.format_entries(:usd, :nl_NL, entries) ==
             """
             Datum      | Omschrijving              | Verandering\s\s
             12-03-2015 | Buy present               |    $ -123,45\s
             """
  end

  @tag :pending
  test "American negative number with 3 digits before decimal point" do
    entries = [
      %{amount_in_cents: -12345, date: ~D[2015-03-12], description: "Buy present"}
    ]

    assert Ledger.format_entries(:usd, :en_US, entries) ==
             """
             Date       | Description               | Change\s\s\s\s\s\s\s
             03/12/2015 | Buy present               |     ($123.45)
             """
  end
end

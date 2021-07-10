defmodule RestApi do
  @type user ::
          %{
            name: String.t(),
            balance: integer,
            owed_by: %{String.t() => integer},
            owes: %{String.t() => integer}
          }

  @opaque api :: pid

  defmodule User do
    defstruct [:name, balance: 0, owed_by: %{}, owes: %{}]
  end

  @doc """
  Initialize REST API with initial data.
  """
  @spec init(database :: [user]) :: {:ok, api}
  def init(users) do
    Agent.start_link(fn -> create_tables(users) end)
  end

  @doc """
  Return JSON data based on request.
  """
  @spec get(api :: api, url :: String.t(), payload :: String.t()) :: String.t()
  def get(_api, "/users", ""), do: to_json(%{users: []})

  def get(api, "/users", payload) do
    %{users: users} = from_json(payload)

    users =
      Agent.get(api, fn {user_table, debts_table} ->
        Enum.map(users, &get_user(user_table, debts_table, &1))
      end)

    to_json(%{users: users})
  end

  @doc """
  Modify database and return JSON data based on request.
  """
  @spec post(api :: api, url :: String.t(), payload :: String.t()) :: String.t()
  def post(api, "/add", payload) do
    %{user: name} = from_json(payload)

    Agent.get(api, fn {user_table, debts_table} ->
      add_user(user_table, name)
      get_user(user_table, debts_table, name)
    end)
    |> to_json
  end

  def post(api, "/iou", payload) do
    %{amount: amount, borrower: borrower, lender: lender} = from_json(payload)

    users =
      Agent.get(api, fn {user_table, debts_table} ->
        update_balance(user_table, borrower, -amount)
        update_balance(user_table, lender, amount)
        add_debt(debts_table, borrower, lender, amount)
        [get_user(user_table, debts_table, borrower), get_user(user_table, debts_table, lender)]
      end)

    to_json(%{users: Enum.sort_by(users, & &1.name)})
  end

  # JSON

  def from_json(json) do
    {data, _} =
      Regex.replace(~r/"([a-z_]+)":/, json, "\\1: ")
      |> String.replace("\":", "\" => ")
      |> String.replace("{", "%{")
      |> Code.eval_string()

    data
  end

  def to_json(%{} = map) do
    Regex.replace(~r/([a-z_]+): /, inspect(map), "\"\\1\":")
    |> String.replace(~r/%[^{]*{/, "{")
    |> String.replace("=>", ":")
    |> String.replace(" ", "")
  end

  # ETS Manipulation

  defp create_tables(users) do
    user_table = :ets.new(:users, [:set, :protected])
    debts_table = :ets.new(:debts, [:duplicate_bag, :protected])

    Enum.each(users, fn %{name: user, balance: balance, owes: owes} ->
      :ets.insert(user_table, {user, balance})

      # {{"Alice", "Bob"}, 10} means Alice owes Bob 10 million dollars
      Enum.each(owes, fn {name, amount} -> :ets.insert(debts_table, {{user, name}, amount}) end)
    end)

    {user_table, debts_table}
  end

  defp add_user(user_table, name) do
    :ets.insert(user_table, {name, 0})
  end

  defp update_balance(user_table, name, increase) do
    [[balance]] = :ets.match(user_table, {name, :"$1"})
    :ets.insert(user_table, {name, balance + increase})
  end

  defp get_user(user_table, debts_table, user_name) do
    [[balance]] = :ets.match(user_table, {user_name, :"$1"})

    owes =
      :ets.match(debts_table, {{user_name, :"$1"}, :"$2"})
      |> Enum.reduce(%{}, fn [name, amount], owes ->
        Map.update(owes, name, amount, &(&1 + amount))
      end)

    # Debts include owes
    debts =
      :ets.match(debts_table, {{:"$1", user_name}, :"$2"})
      |> Enum.reduce(owes, fn [name, amount], owed ->
        Map.update(owed, name, -amount, &(&1 - amount))
      end)

    {owes, owed_by} =
      Enum.reduce(debts, {%{}, %{}}, fn
        {_name, 0}, {owes, owed_by} -> {owes, owed_by}
        {name, debt}, {owes, owed_by} when debt > 0 -> {Map.put(owes, name, debt), owed_by}
        {name, debt}, {owes, owed_by} when debt < 0 -> {owes, Map.put(owed_by, name, -debt)}
      end)

    %User{name: user_name, balance: balance, owed_by: owed_by, owes: owes}
  end

  def add_debt(debts_table, borrower, lender, amount) do
    :ets.insert(debts_table, {{borrower, lender}, amount})
  end
end

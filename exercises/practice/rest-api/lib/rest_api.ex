defmodule RestApi do
  @type user ::
          %{
            name: String.t(),
            balance: integer,
            owed_by: %{String.t() => integer},
            owes: %{String.t() => integer}
          }

  @opaque api :: pid

  @doc """
  Initialize REST API with initial data.
  """
  @spec init(database :: [user]) :: {:ok, api}
  def init(users) do
  end

  @doc """
  Return JSON data based on request.
  """
  @spec get(api :: api, url :: String.t(), payload :: String.t()) :: String.t()
  def get(api, url, payload) do
  end

  @doc """
  Modify database and return JSON data based on request.
  """
  @spec post(api :: api, url :: String.t(), payload :: String.t()) :: String.t()
  def post(api, url, payload) do
  end
end

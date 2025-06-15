defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    MapSet.new([card])
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    {MapSet.member?(collection, card), MapSet.put(collection, card)}
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    can_trade? =
      MapSet.member?(collection, your_card) and not MapSet.member?(collection, their_card)

    updated_collection =
      collection
      |> MapSet.delete(your_card)
      |> MapSet.put(their_card)

    {can_trade?, updated_collection}
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    cards
    |> MapSet.new()
    |> MapSet.to_list()
    |> Enum.sort()
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    your_collection
    |> MapSet.difference(their_collection)
    |> MapSet.size()
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards(collections) do
    case collections do
      [] ->
        []

      [collection | rest] ->
        Enum.reduce(rest, collection, &MapSet.intersection/2)
        |> MapSet.to_list()
        |> Enum.sort()
    end
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards(collections) do
    collections
    |> Enum.reduce(MapSet.new(), &MapSet.union/2)
    |> MapSet.size()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    {shiny, not_shiny} = MapSet.split_with(collection, &String.starts_with?(&1, "Shiny"))

    shiny_list = shiny |> MapSet.to_list() |> Enum.sort()
    not_shiny_list = not_shiny |> MapSet.to_list() |> Enum.sort()

    {shiny_list, not_shiny_list}
  end
end

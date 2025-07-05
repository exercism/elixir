defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    # Please implement new_collection/1
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    # Please implement add_card/2
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    # Please implement trade_card/3
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    # Please implement remove_duplicates/1
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    # Please implement extra_cards/2
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards(collections) do
    # Please implement boring_cards/1
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards(collections) do
    # Please implement total_cards/1
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    # Please implement split_shiny_cards/1
  end
end

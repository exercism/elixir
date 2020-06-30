defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, 100.00)

    for top <- tops,
        %{base_color: top_base_color, price: top_price} = top,
        bottom <- bottoms,
        %{base_color: bottom_base_color, price: bottom_price} = bottom,
        top_base_color != bottom_base_color,
        (top_price + bottom_price) <= maximum_price
    do
      {top, bottom}
    end
  end
end

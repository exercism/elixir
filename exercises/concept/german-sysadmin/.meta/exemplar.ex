defmodule Username do
  def sanitize(~c"") do
    ~c""
  end

  def sanitize([head | tail]) do
    sanitized =
      case head do
        ?ß -> ~c"ss"
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        x when x >= ?a and x <= ?z -> [x]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    sanitized ++ sanitize(tail)
  end
end

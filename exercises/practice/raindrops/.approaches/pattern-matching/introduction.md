# Introduction

## Pattern matching

We can be very explicit with the solution and explicitly match all the possible patterns. 

```elixir
def convert(number) do
  case {rem(number, 3), rem(number, 5), rem(number, 7)} do
    {0, 0, 0} -> "PlingPlangPlong"
    {0, 0, _} -> "PlingPlang"
    {0, _, 0} -> "PlingPlong"
    {_, 0, 0} -> "PlangPlong"
    {0, _, _} -> "Pling"
    {_, 0, _} -> "Plang"
    {_, _, 0} -> "Plong"
    _ -> Integer.to_string(number)
  end
end
```
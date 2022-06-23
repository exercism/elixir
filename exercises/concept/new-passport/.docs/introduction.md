# Introduction

## With

The [special form with][with] provides a way to focus on the "happy path" of a series of potentially failing steps and deal with the failures later.

```elixir
with {:ok, id} <- get_id(username),
     {:ok, avatar} <- fetch_avatar(id),
     {:ok, image_type} <- check_valid_image_type(avatar) do
  {:ok, image_type, avatar}
else
  :not_found ->
    {:error, "invalid username"}

  {:error, "not an image"} ->
    {:error, "avatar associated to #{username} is not an image"}

  err ->
    err
end
```

At each step, if a clause matches, the chain will continue until the `do` block is executed. If one match fails, the chain stops and the non-matching clause is returned. You have the option of using an `else` block to catch failed matches and modify the return value.

[with]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1

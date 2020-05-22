In this exercise you need to implement some functions to manipulate a list of programming languages.

## 1. Define a function to return an empty language list

Define the `new/1` function that takes no parameters and returns an empty list.

```elixir
LanguageList.new()
# => []
```

## 2. Define a function to add a language to the list

Define the `add/2` function that takes 2 parameters (a _language list_ and a string literal of a _language_). It should return the resulting list with the new language prepended to the given list.

```elixir
LanguageList.new() |> LanguageList.add("Clojure")
# => ["Clojure"]
```

## 3. Define a function to remove a language from the list

Define the `remove/2` function that takes 1 parameter1 (a _language list_). It should return the list minus the first item.

```elixir
LanguageList.new() |> LanguageList.add("Haskell") |> LanguageList.remove()
# => []
```

## 4. Define a function to return the first item in the list

Define the `first/1` function that takes 1 parameter (a _language list_). It should return the string literal of the language that occurs first in the list.

```elixir
LanguageList.new() |> LanguageList.add("Prolog") |> LanguageList.first()
# => "Prolog"
```

## 5. Define a function to return how many languages are in the list

Define the `count/1` function that takes 1 parameter (a _language list_). It should return the number of languages in the list.

```elixir
LanguageList.new() |> LanguageList.add("Elm") |> LanguageList.first()
# => 1
```

## 6. Define a function to determine if the list is exciting

Define the `exciting_list?/1` function which takes 1 parameter (a _language list_). It should return a boolean value. It should return true if _"Elixir"_ is one of the languages in the list.

```elixir
LanguageList.new() |> LanguageList.add("Elixir") |> LanguageList.first()
# => true
```

# Instructions

In this exercise you need to implement some functions to manipulate a list of programming languages.

## 1. Define a function to return an empty language list

Define the `new/0` function that takes no arguments and returns an empty list.

```elixir
LanguageList.new()
# => []
```

## 2. Define a function to add a language to the list

Define the `add/2` function that takes 2 arguments (a _language list_ and a string literal of a _language_). It should return the resulting list with the new language prepended to the given list.

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Clojure")
# => ["Clojure"]
language_list = LanguageList.add(language_list, "Haskell")
# => ["Haskell", "Clojure"]
```

## 3. Define a function to remove a language from the list

Define the `remove/1` function that takes 1 argument (a _language list_). It should return the list without the first item. Assume the list will always have at least one item.

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Clojure")
# => ["Clojure"]
language_list = LanguageList.add(language_list, "Haskell")
# => ["Haskell", "Clojure"]
language_list = LanguageList.remove(language_list)
# => ["Clojure"]
```

## 4. Define a function to return the first item in the list

Define the `first/1` function that takes 1 argument (a _language list_). It should return the first language in the list. Assume the list will always have at least one item.

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Elm")
# => ["Elm"]
language_list = LanguageList.add(language_list, "Prolog")
# => ["Prolog", "Elm"]
LanguageList.first(language_list)
# => "Prolog"
```

## 5. Define a function to return how many languages are in the list

Define the `count/1` function that takes 1 argument (a _language list_). It should return the number of languages in the list.

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Elm")
# => ["Elm"]
language_list = LanguageList.add(language_list, "Prolog")
# => ["Prolog", "Elm"]
LanguageList.count(language_list)
# => 2
```

## 6. Define a function to determine if the list includes a functional language

Define the `functional_list?/1` function which takes 1 argument (a _language list_). It should return a boolean value. It should return true if _"Elixir"_ is one of the languages in the list.

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Elixir")
# => ["Elixir"]
LanguageList.functional_list?(language_list)
# => true
```

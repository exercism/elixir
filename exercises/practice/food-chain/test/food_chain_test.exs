defmodule FoodChainTest do
  use ExUnit.Case

  # @tag :pending
  test "fly" do
    start = 1
    stop = 1
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "spider" do
    start = 2
    stop = 2
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a spider.
    It wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "bird" do
    start = 3
    stop = 3
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a bird.
    How absurd to swallow a bird!
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "cat" do
    start = 4
    stop = 4
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a cat.
    Imagine that, to swallow a cat!
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "dog" do
    start = 5
    stop = 5
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a dog.
    What a hog, to swallow a dog!
    She swallowed the dog to catch the cat.
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "goat" do
    start = 6
    stop = 6
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a goat.
    Just opened her throat and swallowed a goat!
    She swallowed the goat to catch the dog.
    She swallowed the dog to catch the cat.
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "cow" do
    start = 7
    stop = 7
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a cow.
    I don't know how she swallowed a cow!
    She swallowed the cow to catch the goat.
    She swallowed the goat to catch the dog.
    She swallowed the dog to catch the cat.
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "horse" do
    start = 8
    stop = 8
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a horse.
    She's dead, of course!
    """

    assert output == expected
  end

  @tag :pending
  test "multiple verses" do
    start = 1
    stop = 3
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a spider.
    It wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a bird.
    How absurd to swallow a bird!
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """

    assert output == expected
  end

  @tag :pending
  test "full song" do
    start = 1
    stop = 8
    output = FoodChain.recite(start, stop)

    expected = """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a spider.
    It wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a bird.
    How absurd to swallow a bird!
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a cat.
    Imagine that, to swallow a cat!
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a dog.
    What a hog, to swallow a dog!
    She swallowed the dog to catch the cat.
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a goat.
    Just opened her throat and swallowed a goat!
    She swallowed the goat to catch the dog.
    She swallowed the dog to catch the cat.
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a cow.
    I don't know how she swallowed a cow!
    She swallowed the cow to catch the goat.
    She swallowed the goat to catch the dog.
    She swallowed the dog to catch the cat.
    She swallowed the cat to catch the bird.
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.

    I know an old lady who swallowed a horse.
    She's dead, of course!
    """

    assert output == expected
  end
end

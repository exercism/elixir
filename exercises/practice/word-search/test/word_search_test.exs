defmodule WordSearchTest do
  use ExUnit.Case
  alias WordSearch.Location

  # Grid rows and columns are 1-indexed.
  # @tag :pending
  test "Should accept an initial game grid and a target search word" do
    grid = "jefblpepre"
    words = ["clojure"]
    output = WordSearch.search(grid, words)
    expected = %{"clojure" => nil}

    assert output == expected
  end

  @tag :pending
  test "Should locate one word written left to right" do
    grid = "clojurermt"
    words = ["clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {1, 1}, to: {1, 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate the same word written left to right in a different position" do
    grid = "mtclojurer"
    words = ["clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {1, 3}, to: {1, 9}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a different left to right word" do
    grid = "coffeelplx"
    words = ["coffee"]
    output = WordSearch.search(grid, words)

    expected = %{
      "coffee" => %Location{from: {1, 1}, to: {1, 6}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate that different left to right word in a different position" do
    grid = "xcoffeezlp"
    words = ["coffee"]
    output = WordSearch.search(grid, words)

    expected = %{
      "coffee" => %Location{from: {1, 2}, to: {1, 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a left to right word in two line grid" do
    grid = """
    jefblpepre
    tclojurerm
    """

    words = ["clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {2, 2}, to: {2, 8}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a left to right word in three line grid" do
    grid = """
    camdcimgtc
    jefblpepre
    clojurermt
    """

    words = ["clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {3, 1}, to: {3, 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a left to right word in ten line grid" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate that left to right word in a different position in a ten line grid" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    clojurermt
    jalaycalmp
    """

    words = ["clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {9, 1}, to: {9, 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a different left to right word in a ten line grid" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    fortranftw
    alxhpburyi
    clojurermt
    jalaycalmp
    """

    words = ["fortran"]
    output = WordSearch.search(grid, words)

    expected = %{
      "fortran" => %Location{from: {7, 1}, to: {7, 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate multiple words" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    fortranftw
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["fortran", "clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "fortran" => %Location{from: {7, 1}, to: {7, 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a single word written right to left" do
    grid = "rixilelhrs"
    words = ["elixir"]
    output = WordSearch.search(grid, words)

    expected = %{
      "elixir" => %Location{from: {1, 6}, to: {1, 1}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate multiple words written in different horizontal directions" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["elixir", "clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate words written top to bottom" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["clojure", "elixir", "ecmascript"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "ecmascript" => %Location{from: {1, 10}, to: {10, 10}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate words written bottom to top" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["clojure", "elixir", "ecmascript", "rust"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "ecmascript" => %Location{from: {1, 10}, to: {10, 10}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}},
      "rust" => %Location{from: {5, 9}, to: {2, 9}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate words written top left to bottom right" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["clojure", "elixir", "ecmascript", "rust", "java"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "ecmascript" => %Location{from: {1, 10}, to: {10, 10}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}},
      "java" => %Location{from: {1, 1}, to: {4, 4}},
      "rust" => %Location{from: {5, 9}, to: {2, 9}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate words written bottom right to top left" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["clojure", "elixir", "ecmascript", "rust", "java", "lua"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "ecmascript" => %Location{from: {1, 10}, to: {10, 10}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}},
      "java" => %Location{from: {1, 1}, to: {4, 4}},
      "lua" => %Location{from: {9, 8}, to: {7, 6}},
      "rust" => %Location{from: {5, 9}, to: {2, 9}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate words written bottom left to top right" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "ecmascript" => %Location{from: {1, 10}, to: {10, 10}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}},
      "java" => %Location{from: {1, 1}, to: {4, 4}},
      "lisp" => %Location{from: {6, 3}, to: {3, 6}},
      "lua" => %Location{from: {9, 8}, to: {7, 6}},
      "rust" => %Location{from: {5, 9}, to: {2, 9}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate words written top right to bottom left" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = ["clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp", "ruby"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "ecmascript" => %Location{from: {1, 10}, to: {10, 10}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}},
      "java" => %Location{from: {1, 1}, to: {4, 4}},
      "lisp" => %Location{from: {6, 3}, to: {3, 6}},
      "lua" => %Location{from: {9, 8}, to: {7, 6}},
      "ruby" => %Location{from: {6, 8}, to: {9, 5}},
      "rust" => %Location{from: {5, 9}, to: {2, 9}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should fail to locate a word that is not in the puzzle" do
    grid = """
    jefblpepre
    camdcimgtc
    oivokprjsm
    pbwasqroua
    rixilelhrs
    wolcqlirpc
    screeaumgr
    alxhpburyi
    jalaycalmp
    clojurermt
    """

    words = [
      "clojure",
      "elixir",
      "ecmascript",
      "rust",
      "java",
      "lua",
      "lisp",
      "ruby",
      "haskell"
    ]

    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: {10, 1}, to: {10, 7}},
      "ecmascript" => %Location{from: {1, 10}, to: {10, 10}},
      "elixir" => %Location{from: {5, 6}, to: {5, 1}},
      "haskell" => nil,
      "java" => %Location{from: {1, 1}, to: {4, 4}},
      "lisp" => %Location{from: {6, 3}, to: {3, 6}},
      "lua" => %Location{from: {9, 8}, to: {7, 6}},
      "ruby" => %Location{from: {6, 8}, to: {9, 5}},
      "rust" => %Location{from: {5, 9}, to: {2, 9}}
    }

    assert output == expected
  end
end

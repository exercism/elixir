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
      "clojure" => %Location{from: %{row: 1, column: 1}, to: %{row: 1, column: 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate the same word written left to right in a different position" do
    grid = "mtclojurer"
    words = ["clojure"]
    output = WordSearch.search(grid, words)

    expected = %{
      "clojure" => %Location{from: %{row: 1, column: 3}, to: %{row: 1, column: 9}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a different left to right word" do
    grid = "coffeelplx"
    words = ["coffee"]
    output = WordSearch.search(grid, words)

    expected = %{
      "coffee" => %Location{from: %{row: 1, column: 1}, to: %{row: 1, column: 6}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate that different left to right word in a different position" do
    grid = "xcoffeezlp"
    words = ["coffee"]
    output = WordSearch.search(grid, words)

    expected = %{
      "coffee" => %Location{from: %{row: 1, column: 2}, to: %{row: 1, column: 7}}
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
      "clojure" => %Location{from: %{row: 2, column: 2}, to: %{row: 2, column: 8}}
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
      "clojure" => %Location{from: %{row: 3, column: 1}, to: %{row: 3, column: 7}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}}
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
      "clojure" => %Location{from: %{row: 9, column: 1}, to: %{row: 9, column: 7}}
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
      "fortran" => %Location{from: %{row: 7, column: 1}, to: %{row: 7, column: 7}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "fortran" => %Location{from: %{row: 7, column: 1}, to: %{row: 7, column: 7}}
    }

    assert output == expected
  end

  @tag :pending
  test "Should locate a single word written right to left" do
    grid = "rixilelhrs"
    words = ["elixir"]
    output = WordSearch.search(grid, words)

    expected = %{
      "elixir" => %Location{from: %{row: 1, column: 6}, to: %{row: 1, column: 1}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "ecmascript" => %Location{from: %{row: 1, column: 10}, to: %{row: 10, column: 10}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "ecmascript" => %Location{from: %{row: 1, column: 10}, to: %{row: 10, column: 10}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}},
      "rust" => %Location{from: %{row: 5, column: 9}, to: %{row: 2, column: 9}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "ecmascript" => %Location{from: %{row: 1, column: 10}, to: %{row: 10, column: 10}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}},
      "java" => %Location{from: %{row: 1, column: 1}, to: %{row: 4, column: 4}},
      "rust" => %Location{from: %{row: 5, column: 9}, to: %{row: 2, column: 9}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "ecmascript" => %Location{from: %{row: 1, column: 10}, to: %{row: 10, column: 10}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}},
      "java" => %Location{from: %{row: 1, column: 1}, to: %{row: 4, column: 4}},
      "lua" => %Location{from: %{row: 9, column: 8}, to: %{row: 7, column: 6}},
      "rust" => %Location{from: %{row: 5, column: 9}, to: %{row: 2, column: 9}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "ecmascript" => %Location{from: %{row: 1, column: 10}, to: %{row: 10, column: 10}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}},
      "java" => %Location{from: %{row: 1, column: 1}, to: %{row: 4, column: 4}},
      "lisp" => %Location{from: %{row: 6, column: 3}, to: %{row: 3, column: 6}},
      "lua" => %Location{from: %{row: 9, column: 8}, to: %{row: 7, column: 6}},
      "rust" => %Location{from: %{row: 5, column: 9}, to: %{row: 2, column: 9}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "ecmascript" => %Location{from: %{row: 1, column: 10}, to: %{row: 10, column: 10}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}},
      "java" => %Location{from: %{row: 1, column: 1}, to: %{row: 4, column: 4}},
      "lisp" => %Location{from: %{row: 6, column: 3}, to: %{row: 3, column: 6}},
      "lua" => %Location{from: %{row: 9, column: 8}, to: %{row: 7, column: 6}},
      "ruby" => %Location{from: %{row: 6, column: 8}, to: %{row: 9, column: 5}},
      "rust" => %Location{from: %{row: 5, column: 9}, to: %{row: 2, column: 9}}
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
      "clojure" => %Location{from: %{row: 10, column: 1}, to: %{row: 10, column: 7}},
      "ecmascript" => %Location{from: %{row: 1, column: 10}, to: %{row: 10, column: 10}},
      "elixir" => %Location{from: %{row: 5, column: 6}, to: %{row: 5, column: 1}},
      "haskell" => nil,
      "java" => %Location{from: %{row: 1, column: 1}, to: %{row: 4, column: 4}},
      "lisp" => %Location{from: %{row: 6, column: 3}, to: %{row: 3, column: 6}},
      "lua" => %Location{from: %{row: 9, column: 8}, to: %{row: 7, column: 6}},
      "ruby" => %Location{from: %{row: 6, column: 8}, to: %{row: 9, column: 5}},
      "rust" => %Location{from: %{row: 5, column: 9}, to: %{row: 2, column: 9}}
    }

    assert output == expected
  end
end

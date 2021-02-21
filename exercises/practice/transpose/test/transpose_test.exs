defmodule TransposeTest do
  use ExUnit.Case

  test "empty string" do
    input = ""
    expected = ""

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "two characters in a row" do
    input = "A1"
    expected = "A\n" <> "1"

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "two characters in one column" do
    input = "A\n" <> "1"
    expected = "A1"

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "simple" do
    input = "ABC\n" <> "123"
    expected = "A1\n" <> "B2\n" <> "C3"

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "single line" do
    input = "Single line."

    expected =
      "S\n" <>
        "i\n" <>
        "n\n" <> "g\n" <> "l\n" <> "e\n" <> " \n" <> "l\n" <> "i\n" <> "n\n" <> "e\n" <> "."

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "first line longer than second line" do
    input = "The fourth line.\n" <> "The fifth line."

    expected =
      "TT\n" <>
        "hh\n" <>
        "ee\n" <>
        "  \n" <>
        "ff\n" <>
        "oi\n" <>
        "uf\n" <>
        "rt\n" <> "th\n" <> "h \n" <> " l\n" <> "li\n" <> "in\n" <> "ne\n" <> "e.\n" <> "."

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "second line longer than first line" do
    input = "The first line.\n" <> "The second line."

    expected =
      "TT\n" <>
        "hh\n" <>
        "ee\n" <>
        "  \n" <>
        "fs\n" <>
        "ie\n" <>
        "rc\n" <>
        "so\n" <>
        "tn\n" <>
        " d\n" <>
        "l \n" <>
        "il\n" <>
        "ni\n" <>
        "en\n" <>
        ".e\n" <>
        " ."

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "mixed line length" do
    input =
      "The longest line.\n" <>
        "A long line.\n" <>
        "A longer line.\n" <>
        "A line."

    expected =
      "TAAA\n" <>
        "h   \n" <>
        "elll\n" <>
        " ooi\n" <>
        "lnnn\n" <>
        "ogge\n" <>
        "n e.\n" <>
        "glr\n" <>
        "ei \n" <>
        "snl\n" <>
        "tei\n" <>
        " .n\n" <>
        "l e\n" <>
        "i .\n" <>
        "n\n" <>
        "e\n" <>
        "."

    assert Transpose.transpose(input) == expected
  end

  @tag :pending
  test "square" do
    matrix = "HEART\n" <> "EMBER\n" <> "ABUSE\n" <> "RESIN\n" <> "TREND"

    expected = "HEART\n" <> "EMBER\n" <> "ABUSE\n" <> "RESIN\n" <> "TREND"

    assert Transpose.transpose(matrix) == expected
  end

  @tag :pending
  test "rectangle" do
    matrix = "FRACTURE\n" <> "OUTLINED\n" <> "BLOOMING\n" <> "SEPTETTE"

    expected =
      "FOBS\n" <> "RULE\n" <> "ATOP\n" <> "CLOT\n" <> "TIME\n" <> "UNIT\n" <> "RENT\n" <> "EDGE"

    assert Transpose.transpose(matrix) == expected
  end

  @tag :pending
  test "triangle" do
    matrix = "T\n" <> "EE\n" <> "AAA\n" <> "SSSS\n" <> "EEEEE\n" <> "RRRRRR"

    expected = "TEASER\n" <> " EASER\n" <> "  ASER\n" <> "   SER\n" <> "    ER\n" <> "     R"

    assert Transpose.transpose(matrix) == expected
  end

  @tag :pending
  test "jagged triangle" do
    matrix =
      "11\n" <>
        "2\n" <>
        "3333\n" <>
        "444\n" <>
        "555555\n" <>
        "66666"

    expected =
      "123456\n" <>
        "1 3456\n" <>
        "  3456\n" <>
        "  3 56\n" <>
        "    56\n" <>
        "    5"

    assert Transpose.transpose(matrix) == expected
  end

  @tag :pending
  test "many lines" do
    matrix =
      "Chor. Two households, both alike in dignity,\n" <>
        "In fair Verona, where we lay our scene,\n" <>
        "From ancient grudge break to new mutiny,\n" <>
        "Where civil blood makes civil hands unclean.\n" <>
        "From forth the fatal loins of these two foes\n" <>
        "A pair of star-cross'd lovers take their life;\n" <>
        "Whose misadventur'd piteous overthrows\n" <>
        "Doth with their death bury their parents' strife.\n" <>
        "The fearful passage of their death-mark'd love,\n" <>
        "And the continuance of their parents' rage,\n" <>
        "Which, but their children's end, naught could remove,\n" <>
        "Is now the two hours' traffic of our stage;\n" <>
        "The which if you with patient ears attend,\n" <>
        "What here shall miss, our toil shall strive to mend."

    expected =
      "CIFWFAWDTAWITW\n" <>
        "hnrhr hohnhshh\n" <>
        "o oeopotedi ea\n" <>
        "rfmrmash  cn t\n" <>
        ".a e ie fthow \n" <>
        " ia fr weh,whh\n" <>
        "Trnco miae  ie\n" <>
        "w ciroitr btcr\n" <>
        "oVivtfshfcuhhe\n" <>
        " eeih a uote  \n" <>
        "hrnl sdtln  is\n" <>
        "oot ttvh tttfh\n" <>
        "un bhaeepihw a\n" <>
        "saglernianeoyl\n" <>
        "e,ro -trsui ol\n" <>
        "h uofcu sarhu \n" <>
        "owddarrdan o m\n" <>
        "lhg to'egccuwi\n" <>
        "deemasdaeehris\n" <>
        "sr als t  ists\n" <>
        ",ebk 'phool'h,\n" <>
        "  reldi ffd   \n" <>
        "bweso tb  rtpo\n" <>
        "oea ileutterau\n" <>
        "t kcnoorhhnatr\n" <>
        "hl isvuyee'fi \n" <>
        " atv es iisfet\n" <>
        "ayoior trr ino\n" <>
        "l  lfsoh  ecti\n" <>
        "ion   vedpn  l\n" <>
        "kuehtteieadoe \n" <>
        "erwaharrar,fas\n" <>
        "   nekt te  rh\n" <>
        "ismdsehphnnosa\n" <>
        "ncuse ra-tau l\n" <>
        " et  tormsural\n" <>
        "dniuthwea'g t \n" <>
        "iennwesnr hsts\n" <>
        "g,ycoi tkrttet\n" <>
        "n ,l r s'a anr\n" <>
        "i  ef  'dgcgdi\n" <>
        "t  aol   eoe,v\n" <>
        "y  nei sl,u; e\n" <>
        ",  .sf to l   \n" <>
        "     e rv d  t\n" <>
        "     ; ie    o\n" <>
        "       f, r   \n" <>
        "       e  e  m\n" <>
        "       .  m  e\n" <>
        "          o  n\n" <>
        "          v  d\n" <>
        "          e  .\n" <>
        "          ,"

    assert Transpose.transpose(matrix) == expected
  end
end

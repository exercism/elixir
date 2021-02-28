defmodule GrepTest do
  use ExUnit.Case

  setup context do
    if context[:files] do
      File.write!("iliad.txt", """
      Achilles sing, O Goddess! Peleus' son;
      His wrath pernicious, who ten thousand woes
      Caused to Achaia's host, sent many a soul
      Illustrious into Ades premature,
      And Heroes gave (so stood the will of Jove)
      To dogs and to all ravening fowls a prey,
      When fierce dispute had separated once
      The noble Chief Achilles from the son
      Of Atreus, Agamemnon, King of men.
      """)

      File.write!("midsummer-night.txt", """
      I do entreat your grace to pardon me.
      I know not by what power I am made bold,
      Nor how it may concern my modesty,
      In such a presence here to plead my thoughts;
      But I beseech your grace that I may know
      The worst that may befall me in this case,
      If I refuse to wed Demetrius.
      """)

      File.write!("paradise-lost.txt", """
      Of Mans First Disobedience, and the Fruit
      Of that Forbidden Tree, whose mortal tast
      Brought Death into the World, and all our woe,
      With loss of Eden, till one greater Man
      Restore us, and regain the blissful Seat,
      Sing Heav'nly Muse, that on the secret top
      Of Oreb, or of Sinai, didst inspire
      That Shepherd, who first taught the chosen Seed
      """)

      on_exit(fn ->
        File.rm!("iliad.txt")
        File.rm!("midsummer-night.txt")
        File.rm!("paradise-lost.txt")
      end)
    end
  end

  @moduletag :files

  describe "grepping a single file" do
    test "one match, no flags" do
      assert Grep.grep("Agamemnon", [], ["iliad.txt"]) ==
               """
               Of Atreus, Agamemnon, King of men.
               """
    end

    @tag :pending
    test "one match, print line numbers flag" do
      assert Grep.grep("Forbidden", ["-n"], ["paradise-lost.txt"]) ==
               """
               2:Of that Forbidden Tree, whose mortal tast
               """
    end

    @tag :pending
    test "one match, case-insensitive flag" do
      assert Grep.grep("FORBIDDEN", ["-i"], ["paradise-lost.txt"]) ==
               """
               Of that Forbidden Tree, whose mortal tast
               """
    end

    @tag :pending
    test "one match, print file names flag" do
      assert Grep.grep("Forbidden", ["-l"], ["paradise-lost.txt"]) ==
               """
               paradise-lost.txt
               """
    end

    @tag :pending
    test "one match, match entire lines flag" do
      assert Grep.grep("With loss of Eden, till one greater Man", ["-x"], ["paradise-lost.txt"]) ==
               """
               With loss of Eden, till one greater Man
               """
    end

    @tag :pending
    test "one match, multiple flags" do
      assert Grep.grep("OF ATREUS, Agamemnon, KIng of MEN.", ["-n", "-i", "-x"], ["iliad.txt"]) ==
               """
               9:Of Atreus, Agamemnon, King of men.
               """
    end

    @tag :pending
    test "several matches, no flags" do
      assert Grep.grep("may", [], ["midsummer-night.txt"]) ==
               """
               Nor how it may concern my modesty,
               But I beseech your grace that I may know
               The worst that may befall me in this case,
               """
    end

    @tag :pending
    test "several matches, print line numbers flag" do
      assert Grep.grep("may", ["-n"], ["midsummer-night.txt"]) ==
               """
               3:Nor how it may concern my modesty,
               5:But I beseech your grace that I may know
               6:The worst that may befall me in this case,
               """
    end

    @tag :pending
    test "several matches, match entire lines flag" do
      assert Grep.grep("may", ["-x"], ["midsummer-night.txt"]) == ""
    end

    @tag :pending
    test "several matches, case-insensitive flag" do
      assert Grep.grep("ACHILLES", ["-i"], ["iliad.txt"]) ==
               """
               Achilles sing, O Goddess! Peleus' son;
               The noble Chief Achilles from the son
               """
    end

    @tag :pending
    test "several matches, inverted flag" do
      assert Grep.grep("Of", ["-v"], ["paradise-lost.txt"]) ==
               """
               Brought Death into the World, and all our woe,
               With loss of Eden, till one greater Man
               Restore us, and regain the blissful Seat,
               Sing Heav'nly Muse, that on the secret top
               That Shepherd, who first taught the chosen Seed
               """
    end

    @tag :pending
    test "no matches, various flags" do
      assert Grep.grep("Gandalf", ["-n", "-l", "-x", "-i"], ["iliad.txt"]) == ""
    end

    @tag :pending
    test "one match, file flag takes precedence over line flag" do
      assert Grep.grep("ten", ["-n", "-l"], ["iliad.txt"]) ==
               """
               iliad.txt
               """
    end

    @tag :pending
    test "several matches, inverted and match entire lines flags" do
      assert Grep.grep("Illustrious into Ades premature,", ["-x", "-v"], ["iliad.txt"]) ==
               """
               Achilles sing, O Goddess! Peleus' son;
               His wrath pernicious, who ten thousand woes
               Caused to Achaia's host, sent many a soul
               And Heroes gave (so stood the will of Jove)
               To dogs and to all ravening fowls a prey,
               When fierce dispute had separated once
               The noble Chief Achilles from the son
               Of Atreus, Agamemnon, King of men.
               """
    end
  end

  describe "grepping multiples files at once" do
    @tag :pending
    test "one match, no flags" do
      assert Grep.grep("Agamemnon", [], ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]) ==
               """
               iliad.txt:Of Atreus, Agamemnon, King of men.
               """
    end

    @tag :pending
    test "several matches, no flags" do
      assert Grep.grep("may", [], ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]) ==
               """
               midsummer-night.txt:Nor how it may concern my modesty,
               midsummer-night.txt:But I beseech your grace that I may know
               midsummer-night.txt:The worst that may befall me in this case,
               """
    end

    @tag :pending
    test "several matches, print line numbers flag" do
      assert Grep.grep("that", ["-n"], ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]) ==
               """
               midsummer-night.txt:5:But I beseech your grace that I may know
               midsummer-night.txt:6:The worst that may befall me in this case,
               paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast
               paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top
               """
    end

    @tag :pending
    test "one match, print file names flag" do
      assert Grep.grep("who", ["-l"], ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]) ==
               """
               iliad.txt
               paradise-lost.txt
               """
    end

    @tag :pending
    test "several matches, case-insensitive flag" do
      assert Grep.grep("TO", ["-i"], ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]) ==
               """
               iliad.txt:Caused to Achaia's host, sent many a soul
               iliad.txt:Illustrious into Ades premature,
               iliad.txt:And Heroes gave (so stood the will of Jove)
               iliad.txt:To dogs and to all ravening fowls a prey,
               midsummer-night.txt:I do entreat your grace to pardon me.
               midsummer-night.txt:In such a presence here to plead my thoughts;
               midsummer-night.txt:If I refuse to wed Demetrius.
               paradise-lost.txt:Brought Death into the World, and all our woe,
               paradise-lost.txt:Restore us, and regain the blissful Seat,
               paradise-lost.txt:Sing Heav'nly Muse, that on the secret top
               """
    end

    @tag :pending
    test "several matches, inverted flag" do
      assert Grep.grep("a", ["-v"], ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]) ==
               """
               iliad.txt:Achilles sing, O Goddess! Peleus' son;
               iliad.txt:The noble Chief Achilles from the son
               midsummer-night.txt:If I refuse to wed Demetrius.
               """
    end

    @tag :pending
    test "one match, match entire lines flag" do
      assert Grep.grep("But I beseech your grace that I may know", ["-x"], [
               "iliad.txt",
               "midsummer-night.txt",
               "paradise-lost.txt"
             ]) ==
               """
               midsummer-night.txt:But I beseech your grace that I may know
               """
    end

    @tag :pending
    test "one match, multiple flags" do
      assert Grep.grep("WITH LOSS OF EDEN, TILL ONE GREATER MAN", ["-n", "-x", "-i"], [
               "iliad.txt",
               "midsummer-night.txt",
               "paradise-lost.txt"
             ]) ==
               """
               paradise-lost.txt:4:With loss of Eden, till one greater Man
               """
    end

    @tag :pending
    test "no matches, various flags" do
      assert Grep.grep("Frodo", ["-n", "-l", "-x", "-i"], [
               "iliad.txt",
               "midsummer-night.txt",
               "paradise-lost.txt"
             ]) == ""
    end

    @tag :pending
    test "several matches, file flag takes precedence over line number flag" do
      assert Grep.grep("who", ["-n", "-l"], [
               "iliad.txt",
               "midsummer-night.txt",
               "paradise-lost.txt"
             ]) ==
               """
               iliad.txt
               paradise-lost.txt
               """
    end

    @tag :pending
    test "several matches, inverted and match entire lines flags" do
      assert Grep.grep("Illustrious into Ades premature,", ["-x", "-v"], [
               "iliad.txt",
               "midsummer-night.txt",
               "paradise-lost.txt"
             ]) ==
               """
               iliad.txt:Achilles sing, O Goddess! Peleus' son;
               iliad.txt:His wrath pernicious, who ten thousand woes
               iliad.txt:Caused to Achaia's host, sent many a soul
               iliad.txt:And Heroes gave (so stood the will of Jove)
               iliad.txt:To dogs and to all ravening fowls a prey,
               iliad.txt:When fierce dispute had separated once
               iliad.txt:The noble Chief Achilles from the son
               iliad.txt:Of Atreus, Agamemnon, King of men.
               midsummer-night.txt:I do entreat your grace to pardon me.
               midsummer-night.txt:I know not by what power I am made bold,
               midsummer-night.txt:Nor how it may concern my modesty,
               midsummer-night.txt:In such a presence here to plead my thoughts;
               midsummer-night.txt:But I beseech your grace that I may know
               midsummer-night.txt:The worst that may befall me in this case,
               midsummer-night.txt:If I refuse to wed Demetrius.
               paradise-lost.txt:Of Mans First Disobedience, and the Fruit
               paradise-lost.txt:Of that Forbidden Tree, whose mortal tast
               paradise-lost.txt:Brought Death into the World, and all our woe,
               paradise-lost.txt:With loss of Eden, till one greater Man
               paradise-lost.txt:Restore us, and regain the blissful Seat,
               paradise-lost.txt:Sing Heav'nly Muse, that on the secret top
               paradise-lost.txt:Of Oreb, or of Sinai, didst inspire
               paradise-lost.txt:That Shepherd, who first taught the chosen Seed
               """
    end
  end
end

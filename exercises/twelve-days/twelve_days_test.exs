if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("twelve_days.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true, exclude: :pending

defmodule TwelveDaysTest do
  use ExUnit.Case

  describe "count" do
    #@tag :pending
    test "1 returns a" do
      assert TwelveDays.count(1) == "a"
    end

    @tag :pending
    test "2 returns two" do
      assert TwelveDays.count(2) == "two"
    end

    @tag :pending
    test "3 returns three" do
      assert TwelveDays.count(3) == "three"
    end

    @tag :pending
    test "4 returns four" do
      assert TwelveDays.count(4) == "four"
    end

    @tag :pending
    test "5 returns five" do
      assert TwelveDays.count(5) == "five"
    end

    @tag :pending
    test "6 returns six" do
      assert TwelveDays.count(6) == "six"
    end

    @tag :pending
    test "7 returns seven" do
      assert TwelveDays.count(7) == "seven"
    end

    @tag :pending
    test "8 returns eight" do
      assert TwelveDays.count(8) == "eight"
    end

    @tag :pending
    test "9 returns nine" do
      assert TwelveDays.count(9) == "nine"
    end

    @tag :pending
    test "10 returns ten" do
      assert TwelveDays.count(10) == "ten"
    end

    @tag :pending
    test "11 returns eleven" do
      assert TwelveDays.count(11) == "eleven"
    end

    @tag :pending
    test "12 returns twelve" do
      assert TwelveDays.count(12) == "twelve"
    end
  end

  describe "ordinal" do
    @tag :pending
    test "1 returns first" do
      assert TwelveDays.ordinal(1) == "first"
    end

    @tag :pending
    test "2 returns second" do
      assert TwelveDays.ordinal(2) == "second"
    end

    @tag :pending
    test "3 returns third" do
      assert TwelveDays.ordinal(3) == "third"
    end

    @tag :pending
    test "4 returns fourth" do
      assert TwelveDays.ordinal(4) == "fourth"
    end

    @tag :pending
    test "5 returns fifth" do
      assert TwelveDays.ordinal(5) == "fifth"
    end

    @tag :pending
    test "6 returns sixth" do
      assert TwelveDays.ordinal(6) == "sixth"
    end

    @tag :pending
    test "7 returns seventh" do
      assert TwelveDays.ordinal(7) == "seventh"
    end

    @tag :pending
    test "8 returns eighth" do
      assert TwelveDays.ordinal(8) == "eighth"
    end

    @tag :pending
    test "9 returns ninth" do
      assert TwelveDays.ordinal(9) == "ninth"
    end

    @tag :pending
    test "10 returns tenth" do
      assert TwelveDays.ordinal(10) == "tenth"
    end

    @tag :pending
    test "11 returns eleventh" do
      assert TwelveDays.ordinal(11) == "eleventh"
    end

    @tag :pending
    test "12 returns twelfth" do
      assert TwelveDays.ordinal(12) == "twelfth"
    end
  end

  describe "gift" do
    @tag :pending
    test "partridge" do
      assert TwelveDays.gift(1) == "a Partridge in a Pear Tree"
    end

    @tag :pending
    test "turtle doves" do
      assert TwelveDays.gift(2) == "two Turtle Doves"
    end

    @tag :pending
    test "french hens" do
      assert TwelveDays.gift(3) == "three French Hens"
    end

    @tag :pending
    test "calling birds" do
      assert TwelveDays.gift(4) == "four Calling Birds"
    end

    @tag :pending
    test "gold rings" do
      assert TwelveDays.gift(5) == "five Gold Rings"
    end

    @tag :pending
    test "geese-a-laying" do
      assert TwelveDays.gift(6) == "six Geese-a-Laying"
    end

    @tag :pending
    test "swans-a-swimming" do
      assert TwelveDays.gift(7) == "seven Swans-a-Swimming"
    end

    @tag :pending
    test "maids-a-milking" do
      assert TwelveDays.gift(8) == "eight Maids-a-Milking"
    end

    @tag :pending
    test "ladies dancing" do
      assert TwelveDays.gift(9) == "nine Ladies Dancing"
    end

    @tag :pending
    test "lords-a-leaping" do
      assert TwelveDays.gift(10) == "ten Lords-a-Leaping"
    end

    @tag :pending
    test "pipers piping" do
      assert TwelveDays.gift(11) == "eleven Pipers Piping"
    end

    @tag :pending
    test "drummers drumming" do
      assert TwelveDays.gift(12) == "twelve Drummers Drumming"
    end
  end

  describe "verse" do
    @tag :pending
    test "first verse" do
      assert TwelveDays.verse(1) == "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree."
    end

    @tag :pending
    test "second verse" do
      assert TwelveDays.verse(2) == "On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "third verse" do
      assert TwelveDays.verse(3) == "On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "fourth verse" do
      assert TwelveDays.verse(4) == "On the fourth day of Christmas my true love gave to me, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "fifth verse" do
      assert TwelveDays.verse(5) == "On the fifth day of Christmas my true love gave to me, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "sixth verse" do
      assert TwelveDays.verse(6) == "On the sixth day of Christmas my true love gave to me, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "seventh verse" do
      assert TwelveDays.verse(7) == "On the seventh day of Christmas my true love gave to me, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "eighth verse" do
      assert TwelveDays.verse(8) == "On the eighth day of Christmas my true love gave to me, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "ninth verse" do
      assert TwelveDays.verse(9) == "On the ninth day of Christmas my true love gave to me, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "tenth verse" do
      assert TwelveDays.verse(10) == "On the tenth day of Christmas my true love gave to me, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "eleventh verse" do
      assert TwelveDays.verse(11) == "On the eleventh day of Christmas my true love gave to me, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end

    @tag :pending
    test "twelfth verse" do
      assert TwelveDays.verse(12) == "On the twelfth day of Christmas my true love gave to me, twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    end
  end

  describe "verses" do
    @tag :pending
    test "1-3" do
      assert TwelveDays.verses(1, 3) == """
      On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.
      On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.
      On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      """ |> String.trim
    end

    @tag :pending
    test "4-6" do
      assert TwelveDays.verses(4, 6) == """
      On the fourth day of Christmas my true love gave to me, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the fifth day of Christmas my true love gave to me, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the sixth day of Christmas my true love gave to me, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      """ |> String.trim
    end

    @tag :pending
    test "1-6" do
      assert TwelveDays.verses(1, 6) == """
      On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.
      On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.
      On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the fourth day of Christmas my true love gave to me, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the fifth day of Christmas my true love gave to me, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the sixth day of Christmas my true love gave to me, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      """ |> String.trim
    end

    @tag :pending
    test "1-12" do
      assert TwelveDays.verses(1, 12) == """
      On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.
      On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.
      On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the fourth day of Christmas my true love gave to me, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the fifth day of Christmas my true love gave to me, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the sixth day of Christmas my true love gave to me, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the seventh day of Christmas my true love gave to me, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the eighth day of Christmas my true love gave to me, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the ninth day of Christmas my true love gave to me, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the tenth day of Christmas my true love gave to me, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the eleventh day of Christmas my true love gave to me, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the twelfth day of Christmas my true love gave to me, twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      """ |> String.trim
    end
  end

  describe "sing" do
    @tag :pending
    test "all 12 verses" do
      assert TwelveDays.sing == """
      On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.
      On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.
      On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the fourth day of Christmas my true love gave to me, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the fifth day of Christmas my true love gave to me, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the sixth day of Christmas my true love gave to me, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the seventh day of Christmas my true love gave to me, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the eighth day of Christmas my true love gave to me, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the ninth day of Christmas my true love gave to me, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the tenth day of Christmas my true love gave to me, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the eleventh day of Christmas my true love gave to me, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      On the twelfth day of Christmas my true love gave to me, twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
      """ |> String.trim
    end
  end
end


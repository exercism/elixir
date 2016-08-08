if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("garden.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule GardenTest do
  use ExUnit.Case

  test "gets the garden for Alice with just her plants" do
    garden_info = Garden.info("RC\nGG")
    assert garden_info.alice == {:radishes, :clover, :grass, :grass}
  end

  @tag :pending
  test "gets another garden for Alice with just her plants" do
    garden_info = Garden.info("VC\nRC")
    assert garden_info.alice == {:violets, :clover, :radishes, :clover}
  end

  @tag :pending
  test "returns an empty tuple if the child has no plants" do
    garden_info = Garden.info("VC\nRC")
    assert garden_info.bob == {}
  end

  @tag :pending
  test "gets the garden for Bob" do
    garden_info = Garden.info("VVCG\nVVRC")
    assert garden_info.bob == {:clover, :grass, :radishes, :clover}
  end

  @tag :pending
  test "gets the garden for all students" do
    garden_info = Garden.info("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert garden_info.alice == {:violets, :radishes, :violets, :radishes}
    assert garden_info.bob == {:clover, :grass, :clover, :clover}
    assert garden_info.charlie == {:violets, :violets, :clover, :grass}
    assert garden_info.david == {:radishes, :violets, :clover, :radishes}
    assert garden_info.eve == {:clover, :grass, :radishes, :grass}
    assert garden_info.fred == {:grass, :clover, :violets, :clover}
    assert garden_info.ginny == {:clover, :grass, :grass, :clover}
    assert garden_info.harriet == {:violets, :radishes, :radishes, :violets}
    assert garden_info.ileana == {:grass, :clover, :violets, :clover}
    assert garden_info.joseph == {:violets, :clover, :violets, :grass}
    assert garden_info.kincaid == {:grass, :clover, :clover, :grass}
    assert garden_info.larry == {:grass, :violets, :clover, :violets}
  end

  @tag :pending
  test "accepts custom child names" do
    garden_info = Garden.info("VC\nRC", [:nate, :maggie])
    assert garden_info.maggie == {:violets, :clover, :radishes, :clover}
    assert garden_info.nate == {}
  end

  @tag :pending
  test "gets the garden for all students with custom child names" do
    names = [:maggie, :nate, :xander, :ophelia, :pete, :reggie, :sylvia,
             :tanner, :ursula, :victor, :winnie, :ynold]
    garden_string = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
    garden_info = Garden.info(garden_string, names)
    assert garden_info.maggie == {:violets, :radishes, :violets, :radishes}
    assert garden_info.nate == {:clover, :grass, :clover, :clover}
    assert garden_info.ophelia == {:violets, :violets, :clover, :grass}
    assert garden_info.pete == {:radishes, :violets, :clover, :radishes}
    assert garden_info.reggie == {:clover, :grass, :radishes, :grass}
    assert garden_info.sylvia == {:grass, :clover, :violets, :clover}
    assert garden_info.tanner == {:clover, :grass, :grass, :clover}
    assert garden_info.ursula == {:violets, :radishes, :radishes, :violets}
    assert garden_info.victor == {:grass, :clover, :violets, :clover}
    assert garden_info.winnie == {:violets, :clover, :violets, :grass}
    assert garden_info.xander == {:grass, :clover, :clover, :grass}
    assert garden_info.ynold == {:grass, :violets, :clover, :violets}
  end
end

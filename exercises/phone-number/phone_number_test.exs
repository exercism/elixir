if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("phone_number.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule PhoneTest do
  use ExUnit.Case

  test "cleans number" do
    assert Phone.number("(212) 555-0100") == "2125550100"
  end

  @tag :pending
  test "cleans number with dots" do
    assert Phone.number("212.555.0100") == "2125550100"
  end

  @tag :pending
  test "valid when 11 digits and first is 1" do
    assert Phone.number("12125550100") == "2125550100"
  end

  @tag :pending
  test "valid when 11 digits and some decorations" do
    assert Phone.number("+1 (212) 555-0100") == "2125550100"
  end

  @tag :pending
  test "invalid when country calling code is not 1" do
    assert Phone.number("22125550100") == "0000000000"
  end

  @tag :pending
  test "invalid when 9 digits" do
    assert Phone.number("212555010") == "0000000000"
  end

  @tag :pending
  test "invalid when proper number of digits but letters mixed in" do
    assert Phone.number("2a1a2a5a5a5a0a1a0a0a") == "0000000000"
  end

  @tag :pending
  test "invalid with correct number of characters but some are letters" do
    assert Phone.number("2a1a2a5a5a") == "0000000000"
  end

  @tag :pending
  test "invalid when area code begins with 1" do
    assert Phone.number("1125550100") == "0000000000"
  end

  @tag :pending
  test "invalid when area code begins with 0" do
    assert Phone.number("0125550100") == "0000000000"
  end

  @tag :pending
  test "invalid when exchange code begins with 1" do
    assert Phone.number("2121550100") == "0000000000"
  end

  @tag :pending
  test "invalid when exchange code begins with 0" do
    assert Phone.number("2120550100") == "0000000000"
  end

  @tag :pending
  test "area code" do
    assert Phone.area_code("2125550100") == "212"
  end

  @tag :pending
  test "area code with full US phone number" do
    assert Phone.area_code("12125550100") == "212"
  end

  @tag :pending
  test "invalid area code" do
    assert Phone.area_code("(100) 555-1234") == "000"
  end

  @tag :pending
  test "no area code" do
    assert Phone.area_code("867.5309") == "000"
  end

  @tag :pending
  test "pretty print" do
    assert Phone.pretty("2125550100") == "(212) 555-0100"
  end

  @tag :pending
  test "pretty print with full US phone number" do
    assert Phone.pretty("+1 (303) 555-1212") == "(303) 555-1212"
  end

  @tag :pending
  test "pretty print invalid US phone number" do
    assert Phone.pretty("212-155-0100") == "(000) 000-0000"
  end

  @tag :pending
  test "pretty print invalid, short US phone number" do
    assert Phone.pretty("867.5309") == "(000) 000-0000"
  end
end

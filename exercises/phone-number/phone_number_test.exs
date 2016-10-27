if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("phone_number.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule PhoneTest do
  use ExUnit.Case

  test "cleans number" do
    assert Phone.number("(123) 456-7890") == "1234567890"
  end

  @tag :pending
  test "cleans number with dots" do
    assert Phone.number("123.456.7890") == "1234567890"
  end

  @tag :pending
  test "valid when 11 digits and first is 1" do
    assert Phone.number("11234567890") == "1234567890"
  end

  @tag :pending
  test "invalid when 11 digits" do
    assert Phone.number("21234567890") == "0000000000"
  end

  @tag :pending
  test "invalid when 9 digits" do
    assert Phone.number("123456789") == "0000000000"
  end

  @tag :pending
  test "invalid when proper number of digits but letters mixed in" do
    assert Phone.number("1a2a3a4a5a6a7a8a9a0a") == "0000000000"
  end

  @tag :pending
  test "invalid with correct number of characters but some are letters" do
    assert Phone.number("1a2a3a4a5a") == "0000000000"
  end

  @tag :pending
  test "area code" do
    assert Phone.area_code("1234567890") == "123"
  end

  @tag :pending
  test "area code with full US phone number" do
    assert Phone.area_code("11234567890") == "123"
  end

  @tag :pending
  test "pretty print" do
    assert Phone.pretty("1234567890") == "(123) 456-7890"
  end

  @tag :pending
  test "pretty print with full US phone number" do
    assert Phone.pretty("11234567890") == "(123) 456-7890"
  end
end

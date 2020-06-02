defmodule NameBadgeTest do
  use ExUnit.Case
  doctest NameBadge

  describe "print/3" do
    # @tag :pending
    test "prints the employee badge with full data" do
      assert NameBadge.print(455, "Mary M. Brown", "MARKETING") ==
               "[455] - Mary M. Brown - MARKETING"
    end

    @tag :pending
    test "uppercases the department" do
      assert NameBadge.print(89, "Jack McGregor", "Procurement") ==
               "[89] - Jack McGregor - PROCUREMENT"
    end

    @tag :pending
    test "prints the employee badge without id" do
      assert NameBadge.print(nil, "Barbara White", "Security") == "Barbara White - SECURITY"
    end

    @tag :pending
    test "prints the owner badge" do
      assert NameBadge.print(1, "Anna Johnson", nil) == "[1] - Anna Johnson - OWNER"
    end

    @tag :pending
    test "prints the owner badge without id" do
      assert NameBadge.print(nil, "Stephen Dann", nil) == "Stephen Dann - OWNER"
    end
  end
end

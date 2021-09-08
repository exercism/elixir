defmodule RationalNumbersTest do
  use ExUnit.Case

  describe "Addition" do
    # @tag :pending
    test "Add two positive rational numbers" do
      r1 = {1, 2}
      r2 = {2, 3}
      result = {7, 6}
      assert RationalNumbers.add(r1, r2) == result
    end

    @tag :pending
    test "Add a positive rational number and a negative rational number" do
      r1 = {1, 2}
      r2 = {-2, 3}
      result = {-1, 6}
      assert RationalNumbers.add(r1, r2) == result
    end

    @tag :pending
    test "Add two negative rational numbers" do
      r1 = {-1, 2}
      r2 = {-2, 3}
      result = {-7, 6}
      assert RationalNumbers.add(r1, r2) == result
    end

    @tag :pending
    test "Add a rational number to its additive inverse" do
      r1 = {1, 2}
      r2 = {-1, 2}
      result = {0, 1}
      assert RationalNumbers.add(r1, r2) == result
    end
  end

  describe "Subtraction" do
    @tag :pending
    test "Subtract two positive rational numbers" do
      r1 = {1, 2}
      r2 = {2, 3}
      result = {-1, 6}
      assert RationalNumbers.subtract(r1, r2) == result
    end

    @tag :pending
    test "Subtract a positive rational number and a negative rational number" do
      r1 = {1, 2}
      r2 = {-2, 3}
      result = {7, 6}
      assert RationalNumbers.subtract(r1, r2) == result
    end

    @tag :pending
    test "Subtract two negative rational numbers" do
      r1 = {-1, 2}
      r2 = {-2, 3}
      result = {1, 6}
      assert RationalNumbers.subtract(r1, r2) == result
    end

    @tag :pending
    test "Subtract a rational number from itself" do
      r1 = {1, 2}
      r2 = {1, 2}
      result = {0, 1}
      assert RationalNumbers.subtract(r1, r2) == result
    end
  end

  describe "Multiplication" do
    @tag :pending
    test "Multiply two positive rational numbers" do
      r1 = {1, 2}
      r2 = {2, 3}
      result = {1, 3}
      assert RationalNumbers.multiply(r1, r2) == result
    end

    @tag :pending
    test "Multiply a negative rational number by a positive rational number" do
      r1 = {-1, 2}
      r2 = {2, 3}
      result = {-1, 3}
      assert RationalNumbers.multiply(r1, r2) == result
    end

    @tag :pending
    test "Multiply two negative rational numbers" do
      r1 = {-1, 2}
      r2 = {-2, 3}
      result = {1, 3}
      assert RationalNumbers.multiply(r1, r2) == result
    end

    @tag :pending
    test "Multiply a rational number by its reciprocal" do
      r1 = {1, 2}
      r2 = {2, 1}
      result = {1, 1}
      assert RationalNumbers.multiply(r1, r2) == result
    end

    @tag :pending
    test "Multiply a rational number by 1" do
      r1 = {1, 2}
      r2 = {1, 1}
      result = {1, 2}
      assert RationalNumbers.multiply(r1, r2) == result
    end

    @tag :pending
    test "Multiply a rational number by 0" do
      r1 = {1, 2}
      r2 = {0, 1}
      result = {0, 1}
      assert RationalNumbers.multiply(r1, r2) == result
    end
  end

  describe "Division" do
    @tag :pending
    test "Divide two positive rational numbers" do
      r1 = {1, 2}
      r2 = {2, 3}
      result = {3, 4}
      assert RationalNumbers.divide_by(r1, r2) == result
    end

    @tag :pending
    test "Divide a positive rational number by a negative rational number" do
      r1 = {1, 2}
      r2 = {-2, 3}
      result = {-3, 4}
      assert RationalNumbers.divide_by(r1, r2) == result
    end

    @tag :pending
    test "Divide two negative rational numbers" do
      r1 = {-1, 2}
      r2 = {-2, 3}
      result = {3, 4}
      assert RationalNumbers.divide_by(r1, r2) == result
    end

    @tag :pending
    test "Divide a rational number by 1" do
      r1 = {1, 2}
      r2 = {1, 1}
      result = {1, 2}
      assert RationalNumbers.divide_by(r1, r2) == result
    end
  end

  describe "Absolute value" do
    @tag :pending
    test "Absolute value of a positive rational number" do
      r = {1, 2}
      result = {1, 2}
      assert RationalNumbers.abs(r) == result
    end

    @tag :pending
    test "Absolute value of a positive rational number with negative numerator and denominator" do
      r = {-1, -2}
      result = {1, 2}
      assert RationalNumbers.abs(r) == result
    end

    @tag :pending
    test "Absolute value of a negative rational number" do
      r = {-1, 2}
      result = {1, 2}
      assert RationalNumbers.abs(r) == result
    end

    @tag :pending
    test "Absolute value of a negative rational number with negative denominator" do
      r = {1, -2}
      result = {1, 2}
      assert RationalNumbers.abs(r) == result
    end

    @tag :pending
    test "Absolute value of zero" do
      r = {0, 1}
      result = {0, 1}
      assert RationalNumbers.abs(r) == result
    end
  end

  describe "Exponentiation of a rational number" do
    @tag :pending
    test "Raise a positive rational number to a positive integer power" do
      r = {1, 2}
      n = 3
      result = {1, 8}
      assert RationalNumbers.pow_rational(r, n) == result
    end

    @tag :pending
    test "Raise a negative rational number to a positive integer power" do
      r = {-1, 2}
      n = 3
      result = {-1, 8}
      assert RationalNumbers.pow_rational(r, n) == result
    end

    @tag :pending
    test "Raise zero to an integer power" do
      r = {0, 1}
      n = 5
      result = {0, 1}
      assert RationalNumbers.pow_rational(r, n) == result
    end

    @tag :pending
    test "Raise one to an integer power" do
      r = {1, 1}
      n = 4
      result = {1, 1}
      assert RationalNumbers.pow_rational(r, n) == result
    end

    @tag :pending
    test "Raise a positive rational number to the power of zero" do
      r = {1, 2}
      n = 0
      result = {1, 1}
      assert RationalNumbers.pow_rational(r, n) == result
    end

    @tag :pending
    test "Raise a negative rational number to the power of zero" do
      r = {-1, 2}
      n = 0
      result = {1, 1}
      assert RationalNumbers.pow_rational(r, n) == result
    end
  end

  describe "Exponentiation of a real number to a rational number" do
    @tag :pending
    test "Raise a real number to a positive rational number" do
      x = 8
      r = {4, 3}
      result = 16.0
      assert_in_delta RationalNumbers.pow_real(x, r), result, 1.0e-10
    end

    @tag :pending
    test "Raise a real number to a negative rational number" do
      x = 9
      r = {-1, 2}
      result = 0.3333333333333333
      assert_in_delta RationalNumbers.pow_real(x, r), result, 1.0e-10
    end

    @tag :pending
    test "Raise a real number to a zero rational number" do
      x = 2
      r = {0, 1}
      result = 1.0
      assert_in_delta RationalNumbers.pow_real(x, r), result, 1.0e-10
    end
  end

  describe "Reduction to lowest terms" do
    @tag :pending
    test "Reduce a positive rational number to lowest terms" do
      r = {2, 4}
      result = {1, 2}
      assert RationalNumbers.reduce(r) == result
    end

    @tag :pending
    test "Reduce a negative rational number to lowest terms" do
      r = {-4, 6}
      result = {-2, 3}
      assert RationalNumbers.reduce(r) == result
    end

    @tag :pending
    test "Reduce a rational number with a negative denominator to lowest terms" do
      r = {3, -9}
      result = {-1, 3}
      assert RationalNumbers.reduce(r) == result
    end

    @tag :pending
    test "Reduce zero to lowest terms" do
      r = {0, 6}
      result = {0, 1}
      assert RationalNumbers.reduce(r) == result
    end

    @tag :pending
    test "Reduce an integer to lowest terms" do
      r = {-14, 7}
      result = {-2, 1}
      assert RationalNumbers.reduce(r) == result
    end

    @tag :pending
    test "Reduce one to lowest terms" do
      r = {13, 13}
      result = {1, 1}
      assert RationalNumbers.reduce(r) == result
    end

    @tag :pending
    test "Reduce places the minus sign on the numerator" do
      r = {3, -4}
      result = {-3, 4}
      assert RationalNumbers.reduce(r) == result
    end
  end
end

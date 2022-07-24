defmodule ComplexNumbersTest do
  use ExUnit.Case

  def equal({a, b}, {c, d}) do
    assert_in_delta a, c, 1.0e-12
    assert_in_delta b, d, 1.0e-12
  end

  def equal(a, b) do
    assert_in_delta a, b, 1.0e-12
  end

  describe "Real part" do
    # @tag :pending
    test "Real part of a purely real number" do
      z = {1, 0}
      output = ComplexNumbers.real(z)
      expected = 1

      equal(output, expected)
    end

    @tag :pending
    test "Real part of a purely imaginary number" do
      z = {0, 1}
      output = ComplexNumbers.real(z)
      expected = 0

      equal(output, expected)
    end

    @tag :pending
    test "Real part of a number with real and imaginary part" do
      z = {1, 2}
      output = ComplexNumbers.real(z)
      expected = 1

      equal(output, expected)
    end
  end

  describe "Imaginary part" do
    @tag :pending
    test "Imaginary part of a purely real number" do
      z = {1, 0}
      output = ComplexNumbers.imaginary(z)
      expected = 0

      equal(output, expected)
    end

    @tag :pending
    test "Imaginary part of a purely imaginary number" do
      z = {0, 1}
      output = ComplexNumbers.imaginary(z)
      expected = 1

      equal(output, expected)
    end

    @tag :pending
    test "Imaginary part of a number with real and imaginary part" do
      z = {1, 2}
      output = ComplexNumbers.imaginary(z)
      expected = 2

      equal(output, expected)
    end
  end

  @tag :pending
  test "Imaginary unit" do
    z1 = {0, 1}
    z2 = {0, 1}
    output = ComplexNumbers.mul(z1, z2)
    expected = {-1, 0}

    equal(output, expected)
  end

  describe "Addition" do
    @tag :pending
    test "Add purely real numbers" do
      z1 = {1, 0}
      z2 = {2, 0}
      output = ComplexNumbers.add(z1, z2)
      expected = {3, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Add purely imaginary numbers" do
      z1 = {0, 1}
      z2 = {0, 2}
      output = ComplexNumbers.add(z1, z2)
      expected = {0, 3}

      equal(output, expected)
    end

    @tag :pending
    test "Add numbers with real and imaginary part" do
      z1 = {1, 2}
      z2 = {3, 4}
      output = ComplexNumbers.add(z1, z2)
      expected = {4, 6}

      equal(output, expected)
    end
  end

  describe "Subtraction" do
    @tag :pending
    test "Subtract purely real numbers" do
      z1 = {1, 0}
      z2 = {2, 0}
      output = ComplexNumbers.sub(z1, z2)
      expected = {-1, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Subtract purely imaginary numbers" do
      z1 = {0, 1}
      z2 = {0, 2}
      output = ComplexNumbers.sub(z1, z2)
      expected = {0, -1}

      equal(output, expected)
    end

    @tag :pending
    test "Subtract numbers with real and imaginary part" do
      z1 = {1, 2}
      z2 = {3, 4}
      output = ComplexNumbers.sub(z1, z2)
      expected = {-2, -2}

      equal(output, expected)
    end
  end

  describe "Multiplication" do
    @tag :pending
    test "Multiply purely real numbers" do
      z1 = {1, 0}
      z2 = {2, 0}
      output = ComplexNumbers.mul(z1, z2)
      expected = {2, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Multiply purely imaginary numbers" do
      z1 = {0, 1}
      z2 = {0, 2}
      output = ComplexNumbers.mul(z1, z2)
      expected = {-2, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Multiply numbers with real and imaginary part" do
      z1 = {1, 2}
      z2 = {3, 4}
      output = ComplexNumbers.mul(z1, z2)
      expected = {-5, 10}

      equal(output, expected)
    end
  end

  describe "Division" do
    @tag :pending
    test "Divide purely real numbers" do
      z1 = {1, 0}
      z2 = {2, 0}
      output = ComplexNumbers.div(z1, z2)
      expected = {0.5, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Divide purely imaginary numbers" do
      z1 = {0, 1}
      z2 = {0, 2}
      output = ComplexNumbers.div(z1, z2)
      expected = {0.5, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Divide numbers with real and imaginary part" do
      z1 = {1, 2}
      z2 = {3, 4}
      output = ComplexNumbers.div(z1, z2)
      expected = {0.44, 0.08}

      equal(output, expected)
    end
  end

  describe "Absolute value" do
    @tag :pending
    test "Absolute value of a positive purely real number" do
      z = {5, 0}
      output = ComplexNumbers.abs(z)
      expected = 5

      equal(output, expected)
    end

    @tag :pending
    test "Absolute value of a negative purely real number" do
      z = {-5, 0}
      output = ComplexNumbers.abs(z)
      expected = 5

      equal(output, expected)
    end

    @tag :pending
    test "Absolute value of a purely imaginary number with positive imaginary part" do
      z = {0, 5}
      output = ComplexNumbers.abs(z)
      expected = 5

      equal(output, expected)
    end

    @tag :pending
    test "Absolute value of a purely imaginary number with negative imaginary part" do
      z = {0, -5}
      output = ComplexNumbers.abs(z)
      expected = 5

      equal(output, expected)
    end

    @tag :pending
    test "Absolute value of a number with real and imaginary part" do
      z = {3, 4}
      output = ComplexNumbers.abs(z)
      expected = 5

      equal(output, expected)
    end
  end

  describe "Complex conjugate" do
    @tag :pending
    test "Conjugate a purely real number" do
      z = {5, 0}
      output = ComplexNumbers.conjugate(z)
      expected = {5, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Conjugate a purely imaginary number" do
      z = {0, 5}
      output = ComplexNumbers.conjugate(z)
      expected = {0, -5}

      equal(output, expected)
    end

    @tag :pending
    test "Conjugate a number with real and imaginary part" do
      z = {1, 1}
      output = ComplexNumbers.conjugate(z)
      expected = {1, -1}

      equal(output, expected)
    end
  end

  describe "Complex exponential function" do
    @tag :pending
    test "Euler's identity/formula" do
      z = {0, :math.pi()}
      output = ComplexNumbers.exp(z)
      expected = {-1, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Exponential of 0" do
      z = {0, 0}
      output = ComplexNumbers.exp(z)
      expected = {1, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Exponential of a purely real number" do
      z = {1, 0}
      output = ComplexNumbers.exp(z)
      expected = {:math.exp(1), 0}

      equal(output, expected)
    end

    @tag :pending
    test "Exponential of a number with real and imaginary part" do
      z = {:math.log(2), :math.pi()}
      output = ComplexNumbers.exp(z)
      expected = {-2, 0}

      equal(output, expected)
    end

    @tag :pending
    test "Exponential resulting in a number with real and imaginary part" do
      z = {:math.log(2) / 2, :math.pi() / 4}
      output = ComplexNumbers.exp(z)
      expected = {1, 1}

      equal(output, expected)
    end
  end

  describe "Operations between real numbers and complex numbers" do
    @tag :pending
    test "Add real number to complex number" do
      z = {1, 2}
      r = 5
      output = ComplexNumbers.add(z, r)
      expected = {6, 2}

      equal(output, expected)
    end

    @tag :pending
    test "Add complex number to real number" do
      r = 5
      z = {1, 2}
      output = ComplexNumbers.add(r, z)
      expected = {6, 2}

      equal(output, expected)
    end

    @tag :pending
    test "Subtract real number from complex number" do
      z = {5, 7}
      r = 4
      output = ComplexNumbers.sub(z, r)
      expected = {1, 7}

      equal(output, expected)
    end

    @tag :pending
    test "Subtract complex number from real number" do
      r = 4
      z = {5, 7}
      output = ComplexNumbers.sub(r, z)
      expected = {-1, -7}

      equal(output, expected)
    end

    @tag :pending
    test "Multiply complex number by real number" do
      z = {2, 5}
      r = 5
      output = ComplexNumbers.mul(z, r)
      expected = {10, 25}

      equal(output, expected)
    end

    @tag :pending
    test "Multiply real number by complex number" do
      r = 5
      z = {2, 5}
      output = ComplexNumbers.mul(r, z)
      expected = {10, 25}

      equal(output, expected)
    end

    @tag :pending
    test "Divide complex number by real number" do
      z = {10, 100}
      r = 10
      output = ComplexNumbers.div(z, r)
      expected = {1, 10}

      equal(output, expected)
    end

    @tag :pending
    test "Divide real number by complex number" do
      r = 5
      z = {1, 1}
      output = ComplexNumbers.div(r, z)
      expected = {2.5, -2.5}

      equal(output, expected)
    end
  end
end

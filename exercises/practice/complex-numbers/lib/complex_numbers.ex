defmodule ComplexNumbers do
  @typedoc """
  In this module, complex numbers are represented as a tuple-pair containing the real and
  imaginary parts.
  For example, the real number `1` is `{1, 0}`, the imaginary number `i` is `{0, 1}` and
  the complex number `4+3i` is `{4, 3}'.
  """
  @type complex :: {float, float}

  @doc """
  Return the real part of a complex number
  """
  @spec real(a :: complex) :: float
  def real(a) do
  end

  @doc """
  Return the imaginary part of a complex number
  """
  @spec imaginary(a :: complex) :: float
  def imaginary(a) do
  end

  @doc """
  Multiply two complex numbers, or a real and a complex number
  """
  @spec mul(a :: complex | float, b :: complex | float) :: complex
  def mul(a, b) do
  end

  @doc """
  Add two complex numbers, or a real and a complex number
  """
  @spec add(a :: complex | float, b :: complex | float) :: complex
  def add(a, b) do
  end

  @doc """
  Subtract two complex numbers, or a real and a complex number
  """
  @spec sub(a :: complex | float, b :: complex | float) :: complex
  def sub(a, b) do
  end

  @doc """
  Divide two complex numbers, or a real and a complex number
  """
  @spec div(a :: complex | float, b :: complex | float) :: complex
  def div(a, b) do
  end

  @doc """
  Absolute value of a complex number
  """
  @spec abs(a :: complex) :: float
  def abs(a) do
  end

  @doc """
  Conjugate of a complex number
  """
  @spec conjugate(a :: complex) :: complex
  def conjugate(a) do
  end

  @doc """
  Exponential of a complex number
  """
  @spec exp(a :: complex) :: complex
  def exp(a) do
  end
end

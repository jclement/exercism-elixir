defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a0, a1}, {b0, b1}), do: {a0 * b1 + a1 * b0, a1 * b1} |> reduce()

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a0, a1}, {b0, b1}), do: {a0 * b1 - a1 * b0, a1 * b1} |> reduce()

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a0, a1}, {b0, b1}), do: {a0 * b0, a1 * b1} |> reduce()

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(a :: rational, b :: rational) :: rational
  def divide_by(_, 0), do: :error
  def divide_by({a0, a1}, {b0, b1}), do: {a0 * b1, a1 * b0} |> reduce()

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den}) do
    {Kernel.abs(num), Kernel.abs(den)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, den}, n) when n > 0 do
    {Integer.pow(num, n), Integer.pow(den, n)} |> reduce()
  end

  def pow_rational({num, den}, n) when n < 0 do
    {Integer.pow(den, -n), Integer.pow(num, -n)} |> reduce()
  end

  def pow_rational(_, n) when n == 0, do: {1, 1}

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, den}) do
    x ** (num / den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, den}) when den < 0, do: reduce({-num, -den})

  def reduce({num, den}) do
    tmp = Integer.gcd(num, den)
    {trunc(num / tmp), trunc(den / tmp)}
  end
end

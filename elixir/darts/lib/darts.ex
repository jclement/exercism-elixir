defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance({x, y}) |> points()
  end

  defp distance({x, y}) do
    :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))
  end

  defp points(distance) when distance <= 1.0, do: 10
  defp points(distance) when distance <= 5.0, do: 5
  defp points(distance) when distance <= 10.0, do: 1
  defp points(_), do: 0
end

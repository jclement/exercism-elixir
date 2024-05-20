defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume

  def to_milliliter({:cup, volume}), do: {:milliliter, 240 * volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, 30 * volume}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, 5 * volume}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, 15 * volume}
  def to_milliliter({:milliliter, volume}), do: {:milliliter, 1 * volume}

  def from_milliliter({:milliliter, volume}, unit) do
    {unit, volume / get_volume(to_milliliter({unit, 1}))}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end

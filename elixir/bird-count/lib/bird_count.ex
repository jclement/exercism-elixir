defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count(list), do: [hd(list) + 1 | tl(list)]

  def has_day_without_birds?([today | rest]), do: today == 0 || has_day_without_birds?(rest)
  def has_day_without_birds?([]), do: false

  def total([head | tail]), do: head + total(tail)
  def total([]), do: 0

  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)
  def busy_days([_ | tail]), do: busy_days(tail)
  def busy_days([]), do: 0
end

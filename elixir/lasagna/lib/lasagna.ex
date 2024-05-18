defmodule Lasagna do
  @moduledoc """
  Helpful module for cooking lasagna
  """

  @doc """
  Return the expected cooking time for the lasagna
  """
  def expected_minutes_in_oven, do: 40

  @doc """
  Return the remaining cooking time for the lasagna
  """
  def remaining_minutes_in_oven(time), do: expected_minutes_in_oven() - time

  @doc """
  Return the preparation time for the lasagna given the number of layers
  """
  def preparation_time_in_minutes(layers), do: layers * 2

  @doc """
  Return the total time for the lasagna given the number of layers and the time
  """
  def total_time_in_minutes(layers, time), do: preparation_time_in_minutes(layers) + time

  @doc """
  Raise the alarm
  """
  def alarm(), do: "Ding!"
end

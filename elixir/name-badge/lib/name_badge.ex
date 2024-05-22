defmodule NameBadge do
  def print(id, name, department) do
    if(id, do: "[#{id}] - ", else: "") <>
      "#{name} - #{(department || "OWNER") |> String.upcase()}"
  end
end

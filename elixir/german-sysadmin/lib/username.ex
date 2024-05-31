defmodule Username do
  @doc """
  Santize a username removing all invalid characters, and remapping
  a few.
  """
  def sanitize(username) do
    username
    |> Enum.map(fn c ->
      case c do
        ?_ -> ~c"_"
        c when c >= ?a and c <= ?z -> c
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        _ -> ~c""
      end
    end)
    |> List.to_charlist()
  end
end

defmodule DNA do
  @moduledoc """
  Fancy pants functions for encoding/decoding DNA sequences
  """

  @doc """
  Encode a nucleotide to binary

  ## Examples

    iex> DNA.encode_nucleotide(?A)
    0b0001
  """
  @spec encode_nucleotide(char) :: integer
  def encode_nucleotide(?\s), do: 0b0000
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000

  @doc """
  Decode a nucleotide from binary

  ## Examples

    iex> DNA.decode_nucleotide(0b0001)
    ?A
  """
  @spec decode_nucleotide(integer) :: char
  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T

  @doc """
  Encode DNA sequence

  ## Examples

    iex> DNA.encode(~c"AC GT")
    <<18, 4, 8::size(4)>>
  """
  @spec encode(charlist()) :: bitstring()
  def encode(seq), do: encode(seq, <<>>)

  defp encode([], <<>>), do: []
  defp encode([], acc), do: acc
  defp encode([h | t], acc), do: encode(t, <<acc::bitstring, encode_nucleotide(h)::4>>)

  @doc """
  Decode binary DNA sequence

  ## Examples

    iex> DNA.decode(<<132, 2, 1::size(4)>>)
    ~c"TG CA"
  """
  @spec decode(bitstring()) :: charlist()
  def decode(seq), do: decode(seq, [])

  defp decode(<<>>, []), do: []
  defp decode(<<>>, acc), do: acc |> Enum.reverse() |> List.to_charlist()
  defp decode(<<h::4, t::bitstring>>, acc), do: decode(t, [decode_nucleotide(h) | acc])
end

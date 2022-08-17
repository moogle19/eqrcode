defmodule EQRCode.Helpers do
  @type coordinate :: {non_neg_integer(), non_neg_integer()}
  @doc """
  Given the starting point {x, y} and {width, height}
  returns the coordinates of the shape.

  ## Examples

      iex> EQRCode.Matrix.shape({0, 0}, {3, 3})
      [{0, 0}, {0, 1}, {0, 2},
       {1, 0}, {1, 1}, {1, 2},
       {2, 0}, {2, 1}, {2, 2}]

  """
  @spec shape(coordinate, {integer, integer}) :: [coordinate]
  def shape({x, y}, {w, h}) do
    for i <- x..(x + h - 1),
        j <- y..(y + w - 1),
        do: {i, j}
  end

  def zip_cycle(enum, cycle_pattern) do
    zip_cycle(enum, cycle_pattern, cycle_pattern, [])
  end

  def zip_cycle([], _, _, acc), do: Enum.reverse(acc)

  def zip_cycle([h | t], [], [hc | tc] = cycle_pattern, acc) do
    zip_cycle(t, tc, cycle_pattern, [{h, hc} | acc])
  end

  def zip_cycle([h | t], [hc | tc], cycle_pattern, acc) do
    zip_cycle(t, tc, cycle_pattern, [{h, hc} | acc])
  end
end

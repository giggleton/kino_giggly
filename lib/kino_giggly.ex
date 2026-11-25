defimpl Kino.Render, for: Giggly.Plot do
  # Livebook calls this for a plot left as a cell's last value, or passed to `Kino.render/1`;
  # it draws the plot at `Giggly.to_svg/2`'s default size, through `Kino.Giggly.new/2`.
  @doc false
  @spec to_livebook(Giggly.Plot.t()) :: Kino.Output.t()
  def to_livebook(plot) do
    plot
    |> Kino.Giggly.new()
    |> Kino.Render.to_livebook()
  end
end

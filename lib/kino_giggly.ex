defimpl Kino.Render, for: Giggly.Plot do
  def to_livebook(plot) do
    plot
    |> Kino.Giggly.new()
    |> Kino.Render.to_livebook()
  end
end

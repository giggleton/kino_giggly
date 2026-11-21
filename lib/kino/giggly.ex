defmodule Kino.Giggly do
  @moduledoc """
  Draws Giggly plots in Livebook.

  A `Giggly.Plot` left as a cell's last value draws itself below the cell, at
  `Giggly.to_svg/2`'s default size of 700 by 433 pixels:

      GigDatasets.mtcars()
      |> Giggly.Plot.new(%{x: :wt, y: :mpg})
      |> Giggly.Plot.geom_point()

  `Kino.render/1` draws a plot partway through a cell, and `Kino.Frame.render/2` draws one into
  a frame, replacing what it held. `new/2` draws a plot at a size of its own.
  """

  @doc """
  Draws a plot as an SVG image for Livebook to show.

  Takes `Giggly.to_svg/2`'s options, `:width` and `:height` among them, and raises as it does
  for an option it does not take.

      iex> image =
      ...>   GigDatasets.mtcars()
      ...>   |> Giggly.Plot.new(%{x: :wt, y: :mpg})
      ...>   |> Giggly.Plot.geom_point()
      ...>   |> Kino.Giggly.new(width: 400, height: 300)
      iex> image.mime_type
      "image/svg+xml"
  """
  @spec new(Giggly.Plot.t(), keyword()) :: Kino.Image.t()
  def new(%Giggly.Plot{} = plot, options \\ []) when is_list(options) do
    plot
    |> Giggly.to_svg(options)
    |> IO.iodata_to_binary()
    |> Kino.Image.new(:svg)
  end
end

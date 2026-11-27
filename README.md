# KinoGiggly

Draws [Giggly](https://github.com/giggleton/giggly) plots in [Livebook](https://livebook.dev/).
A plot left as a cell's last value draws itself below the cell:

```elixir
GigDatasets.mtcars()
|> Giggly.Plot.new(%{x: :wt, y: :mpg, color: :cyl})
|> Giggly.Plot.geom_point()
```

`Kino.render/1` draws a plot partway through a cell, and `Kino.Giggly.new/2` draws one at a size
of its own:

```elixir
Kino.Giggly.new(plot, width: 400, height: 300)
```

## Installation

In a Livebook notebook's setup cell, install Giggly and KinoGiggly together; the examples above
take their data from gig_datasets:

```elixir
Mix.install([
  {:giggly, "~> 0.3.0"},
  {:kino_giggly, "~> 0.2.0"},
  {:gig_datasets, "~> 0.2.0"}
])
```

## License

MIT; see [LICENSE](LICENSE).

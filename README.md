# KinoGiggly

Draws [Giggly](https://github.com/giggleton/giggly) plots in [Livebook](https://livebook.dev/).
A plot left as a cell's last value draws itself below the cell:

```elixir
Giggly.Datasets.mtcars()
|> Giggly.Plot.new(%{x: :wt, y: :mpg, color: :cyl})
|> Giggly.Plot.geom_point()
```

`Kino.render/1` draws a plot partway through a cell, and `Kino.Giggly.new/2` draws one at a size
of its own:

```elixir
Kino.Giggly.new(plot, width: 400, height: 300)
```

## Installation

Giggly is not yet released. Until it is, install both by path, with the two checkouts side by
side:

```elixir
Mix.install([
  {:giggly, path: "/path/to/giggly"},
  {:kino_giggly, path: "/path/to/kino_giggly"}
])
```

## Licence

MIT; see [LICENSE](LICENSE).

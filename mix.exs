defmodule KinoGiggly.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :kino_giggly,
      version: @version,
      elixir: "~> 1.20",
      deps: deps(),
      description: "Draws Giggly plots in Livebook.",
      package: [licenses: ["MIT"]],
      docs: [main: "Kino.Giggly", source_ref: "v#{@version}"]
    ]
  end

  def application do
    []
  end

  # Giggly is taken by path from the checkout beside this one until it is released; a Hex
  # release of this package waits for Giggly's.
  defp deps do
    [
      {:giggly, path: "../giggly"},
      {:kino, "~> 0.19"},
      {:gig_datasets, path: "../gig_datasets", only: [:dev, :test]},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.40", only: :dev, runtime: false}
    ]
  end
end

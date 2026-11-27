defmodule KinoGiggly.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/giggleton/kino_giggly"

  def project do
    [
      app: :kino_giggly,
      version: @version,
      elixir: "~> 1.20",
      deps: deps(),
      aliases: aliases(),
      description: "Draws Giggly plots in Livebook.",
      source_url: @source_url,
      package: [licenses: ["MIT"], links: %{"GitHub" => @source_url}],
      docs: [main: "Kino.Giggly", source_ref: "v#{@version}"]
    ]
  end

  # `mix quality` runs in test, the environment its `mix test` step needs.
  def cli do
    [preferred_envs: [quality: :test]]
  end

  def application do
    []
  end

  # gig_datasets holds the tables the tests and the doc examples draw.
  defp deps do
    [
      {:giggly, "~> 0.3.0"},
      {:kino, "~> 0.19"},
      {:gig_datasets, "~> 0.2.0", only: [:dev, :test]},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.40", only: :dev, runtime: false}
    ]
  end

  # The commit gate: run bare before every commit; it stops at the first step that fails.
  defp aliases do
    [
      quality: [
        "format --check-formatted",
        "hex.audit",
        "compile --warnings-as-errors",
        "test --warnings-as-errors",
        "credo --strict"
      ]
    ]
  end
end

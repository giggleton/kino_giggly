defmodule Kino.GigglyTest do
  use ExUnit.Case, async: true

  alias Giggly.Plot

  doctest Kino.Giggly

  setup do
    plot =
      Giggly.Datasets.mtcars()
      |> Plot.new(%{x: :wt, y: :mpg})
      |> Plot.geom_point()

    %{plot: plot}
  end

  describe "new/2" do
    test "draws the plot as to_svg/2 does, with its options", %{plot: plot} do
      svg =
        plot
        |> Giggly.to_svg(width: 400, height: 300)
        |> IO.iodata_to_binary()

      assert Kino.Giggly.new(plot, width: 400, height: 300) == Kino.Image.new(svg, :svg)
    end

    test "raises for an option to_svg/2 does not take", %{plot: plot} do
      assert_raise NimbleOptions.ValidationError, ~r/unknown options \[:widht\]/, fn ->
        Kino.Giggly.new(plot, widht: 400)
      end
    end

    test "refuses what is not a plot" do
      # Built as the test runs, since a literal map would be refused by the type checker.
      not_a_plot = Map.new([{:layers, []}])

      assert_raise FunctionClauseError, fn -> Kino.Giggly.new(not_a_plot) end
    end
  end

  describe "Kino.Render" do
    test "a plot draws itself at to_svg/2's default size", %{plot: plot} do
      svg =
        plot
        |> Giggly.to_svg()
        |> IO.iodata_to_binary()

      assert Kino.Render.to_livebook(plot) == %{
               type: :image,
               content: svg,
               mime_type: "image/svg+xml"
             }
    end
  end
end

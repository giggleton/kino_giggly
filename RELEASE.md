# Releasing KinoGiggly

A release goes in one order, and nothing but this file enforces it. The documentation links each
function to its source at the tag `v<version>` (`source_ref` in `mix.exs`), so the tag is pushed
before the package is published.

Publishing to Hex needs the maintainer's Hex keys; it is never done by an agent.

1. **Take Giggly from Hex** (the first release only). Once giggly 0.2.0 and gig_datasets 0.1.0
   are on Hex, switch their entries in `mix.exs`'s `deps` from paths to Hex versions:

   ```elixir
   {:giggly, "~> 0.2.0"},
   {:gig_datasets, "~> 0.1.0", only: [:dev, :test]},
   ```

   rewrite the comment above `deps`, which says Giggly is taken by path, then re-run
   `mix deps.get` and commit the change with `mix.lock`.

2. **Set the version.** In `mix.exs`, set `@version` to the release, say `"0.1.0"`, and commit it.

3. **See the gate pass**: `mix quality` locally, and CI on that commit.

4. **Check the package.**

   ```bash
   mix hex.build --unpack
   ```

   The unpacked package should hold `lib/`, `mix.exs`, `.formatter.exs`, `README.md` and
   `LICENSE`, and nothing else. Delete the unpacked directory afterwards.

5. **Tag and push.**

   ```bash
   git tag v0.1.0
   git push origin main v0.1.0
   ```

6. **Publish.**

   ```bash
   mix hex.publish
   ```

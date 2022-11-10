# FoodTruckBuddy
  An application to find San Francisco Food Trucks by a zip code.

## Steps to get up and running 

 * Download/install PostgreSQL https://www.postgresql.org/download/

 * Download/install Elixir (can use asdf for version control) https://elixir-lang.org/install.html
 * Download/install Erlang (can use asdf for version control) https://www.erlang.org/downloads
 * May need to install hex after installing elixir `mix local.hex` 

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To seed your database with food trucks run `mix run priv/repo/seeds.exs` in the terminal.

To run the test suite run `mix test` from the terminal.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

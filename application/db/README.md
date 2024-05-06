# Db



docker run --name ecto-db -e POSTGRES_PASSWORD=postgres -d postgres:16.2


# Database 
mix ecto.create

# Create table definition
mix ecto.gen.migration create_customer

# Create table in db
mix ecto.migrate
















**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `db` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:db, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/db>.


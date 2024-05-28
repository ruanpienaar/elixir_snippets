#### Phoenix getting started 

install erlang
install elixir

mix local.hex
mix archive.install hex phx_new

mix phx.new hello ( fetch all deps - y )

start database ( or not ... )

cd hello
mix ecto.create

mix phx.server ( or as a running interactive node : iex -S mix phx.server )


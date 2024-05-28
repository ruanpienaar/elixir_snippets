defmodule WorldClock.Repo do
  use Ecto.Repo,
    otp_app: :world_clock,
    adapter: Ecto.Adapters.Postgres
end

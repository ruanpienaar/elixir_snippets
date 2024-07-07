defmodule Crell.Repo do
  use Ecto.Repo,
    otp_app: :crell,
    adapter: Ecto.Adapters.Postgres
end

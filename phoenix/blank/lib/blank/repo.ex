defmodule Blank.Repo do
  use Ecto.Repo,
    otp_app: :blank,
    adapter: Ecto.Adapters.Postgres
end

defmodule LvEtsQuery.Repo do
  use Ecto.Repo,
    otp_app: :lv_ets_query,
    adapter: Ecto.Adapters.Postgres
end

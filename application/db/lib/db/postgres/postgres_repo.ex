defmodule Db.Postgres.Repo do
  @moduledoc """
    Where the data is located

    repositories are wrappers around the data store.
    Via the repository, we can create, update, destroy and query existing entries.
    A repository needs an adapter and credentials to communicate to the database

  """

  use Ecto.Repo,
    otp_app: :db,
    adapter: Ecto.Adapters.Postgres

end

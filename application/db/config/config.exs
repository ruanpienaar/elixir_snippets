import Config

config :db, Db.Postgres.Repo,
  database: "ecto_database",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :db,
  ecto_repos: [Db.Postgres.Repo]

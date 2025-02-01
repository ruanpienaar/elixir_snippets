defmodule Crell.Repo.Migrations.CreateNodes do
  use Ecto.Migration

  def change do
    create table(:nodes) do
      add :node_name, :string
      add :cookie, :string
      add :connected, :boolean, default: false

      timestamps(type: :utc_datetime)
    end
  end
end

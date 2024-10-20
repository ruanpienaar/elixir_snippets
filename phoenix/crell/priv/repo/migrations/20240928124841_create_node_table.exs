defmodule Crell.Repo.Migrations.CreateNodeTable do
  use Ecto.Migration

  def change do
    create table(:node) do
      add :name, :string
      add :cookie, :string
    end
  end
end

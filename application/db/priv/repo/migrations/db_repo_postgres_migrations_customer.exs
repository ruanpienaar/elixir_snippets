defmodule Db.Repo.Postgres.Migrations.CreateCustomer do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:customer) do
      add :name
      add :email
      add :phone, :integer
      add :address
      add :registered, :boolean
      add :age, :integer
    end
  end
end

defmodule Db.Postgres.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customer) do
      add :name, :string
      add :email, :string
      add :phone, :integer
      add :address, :string
      add :registered, :boolean
      add :age, :integer
    end
  end
end

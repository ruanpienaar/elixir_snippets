defmodule Pento.Repo.Migrations.AlterUserEmailToUserUsername2 do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :username, :string, unique: true
    end
  end
end

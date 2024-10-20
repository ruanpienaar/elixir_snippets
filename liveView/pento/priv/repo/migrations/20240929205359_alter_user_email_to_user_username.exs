defmodule Pento.Repo.Migrations.AlterUserEmailToUserUsername do
  use Ecto.Migration

  def up do
    # rename table(:users), :email, to: :username
    # create constraint("users", :username, unique: true)
  end

  def down do
    # rename table(:users), :username, to: :email
  end

end

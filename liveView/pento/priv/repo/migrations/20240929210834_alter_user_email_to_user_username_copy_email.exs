defmodule Pento.Repo.Migrations.AlterUserEmailToUserUsernameCopyEmail do
  use Ecto.Migration

  def change do

    # TODO: come back to this migration later
    # Essentially i wanted to copy email into user name and not have it null

    # alter table(:users) do
    #   update :username, :string
    # end

    # flush()

    # from (u in "users"
    #   update: [set: [username: u.email]],
    #   where: inserted_at)
    #   |> Pento.Repo.update_all([])
  end
end

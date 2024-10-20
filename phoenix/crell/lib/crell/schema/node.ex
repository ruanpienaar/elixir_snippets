defmodule Crell.Node do

  use Ecto.Schema
  import Ecto.Changeset

  schema "node" do
    field :name, :string
    field :cookie, :string
  end

  # TODO: add valid format node name
  def changeset(node, params \\ %{}) do
    node
    |> cast(params, [:name, :cookie])
    |> validate_required([:name, :cookie])
  end

end

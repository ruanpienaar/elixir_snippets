defmodule Crell.Distribution.Node do

  # TODO: valid node name
  # TODO: valic cookie

  use Ecto.Schema
  import Ecto.Changeset

  schema "nodes" do
    field :node_name, :string
    field :cookie, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(node, attrs) do
    node
    |> cast(attrs, [:node_name, :cookie])
    |> validate_required([:node_name, :cookie])
  end

end

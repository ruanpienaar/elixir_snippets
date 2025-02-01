defmodule Crell.Distribution.Node do

  use Ecto.Schema
  import Ecto.Changeset

  schema "nodes" do
    field :node_name, :string
    field :cookie, :string
    field :connected, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(node, attrs) do
    IO.inspect(attrs, label: "Going to update with params")
    node
    |> cast(attrs, [:node_name, :cookie, :connected])
    |> validate_required([:node_name, :cookie, :connected])
  end

  # TODO: valid node name
  # TODO: valid cookie

end

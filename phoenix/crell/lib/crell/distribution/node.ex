defmodule Crell.Distribution.Node do

  # TODO: valid node name
  # TODO: valic cookie

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Crell.Repo

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

  def all do
    Repo.all(
      from(__MODULE__)
    )
  end

  def connected_nodes() do
    Node.list([:visible, :hidden])
  end

end

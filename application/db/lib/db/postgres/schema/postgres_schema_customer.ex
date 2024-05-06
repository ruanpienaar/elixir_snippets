defmodule Db.Postgres.Schema.Customer do
  @moduledoc """
    What the data looks like
  """

  use Ecto.Schema
  import Ecto.Changeset

  # Let's just use the Ecto id default for now.... ( not the line below ... )
  # @primary_key {:customer_id, :id, autogenerate: false}

  schema "customer" do
    field :name # make not null with ecto migration?
    field :email
    field :phone, :integer
    field :address
    field :registered, :boolean
    field :age, :integer
  end

  def changeset(customer, params \\ %{}) do
    customer
    |> cast(params, [:name, :email, :phone, :address, :registered, :age])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$/)
  end

end

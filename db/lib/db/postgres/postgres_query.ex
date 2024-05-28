defmodule Db.Postgres.Query do
  @moduledoc """
    How to interpret the data

    written in Elixir syntax, queries are used to retrieve information
    from a given repository. Ecto queries are secure and composable
  """

  require Logger
  import Ecto.Query
  alias Db.Postgres.{Repo, Schema.Customer}

  # def keyword_query do
  #   query =
  #     from c in Customer,
  #       where: c.registered == true,
  #       select: c
  #   Repo.all(query)
  # end

  # def pipe_query do
  #   Customer
  #   |> where(registered: "true")
  #   |> order_by(:age)
  #   |> limit(10)
  #   |> Repo.all
  # end

  # %Db.Postgres.Schema.Customer{
  #   __meta__: #Ecto.Schema.Metadata<:loaded, "customer">,
  #   customer_id: 1,
  #   name: "name",
  #   email: "email",
  #   phone: 123456789,
  #   address: "Address",
  #   registered: true,
  #   age: 21
  # }
  # def repo_get_customer(customer_id) when is_integer(customer_id) do
  #   Repo.get_by(Db.Postgres.Schema.Customer, customer_id: customer_id)
  # end

  def customer_params(name, email, phone, address, registered, age) do
    %{
      name: name,
      email: email,
      phone: phone,
      address: address,
      registered: registered,
      age: age
    }
  end

  def get_customer_by_id(id) when is_integer(id) do
    Repo.all(
      from(c in Customer,
        where: c.id == ^id
      )
    )
  end

  def get_customer_by_name(name) when is_integer(id) do
    Repo.all(
      from(c in Customer,
        where: c.name == ^name
      )
    )
  end

  # change the code below to use changeset
  def insert_customer(params) do
    insert_customer(params, %Db.Postgres.Schema.Customer{})
  end

  def insert_customer(params, customer) do
    case Repo.insert(Customer.changeset(customer, params)) do
      {:ok, _} ->
        :ok

      {:error, changeset} ->
        Logger.info(%{insert_customer_error: changeset})
        {:error, changeset.errors}
    end
  end

  def update_customer(primary_key, params) do
    customer = Repo.get!(Db.Postgres.Schema.Customer, primary_key)

    case Repo.update(Customer.changeset(customer, params)) do
      {:ok, _} ->
        :ok

      {:error, changeset} ->
        Logger.info(%{insert_customer_error: changeset})
        {:error, changeset.errors}
    end
  end
end

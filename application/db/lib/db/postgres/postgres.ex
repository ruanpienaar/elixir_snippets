defmodule Db.Postgres do
  @moduledoc false

  alias Db.Postgres.Query, as: Query

  def dummy_customer_insert do
    insert_customer(
      "Dummy",
      "Dummy@mail.com",
      12_345_678,
      "Address here",
      false,
      33
    )
  end

  def error_customer_insert do
    insert_customer(
      "Oops",
      "incorrectmai;",
      12_345_678,
      "Address here",
      false,
      33
    )
  end

  def insert_customer(name, email, phone, address, registered, age) do
    Query.insert_customer(
      Query.customer_params(name, email, phone, address, registered, age)
    )
  end

  def dirty_update_customer_email(primary_key, new_email) do
    Query.update_customer(primary_key, %{email: new_email})
  end

end

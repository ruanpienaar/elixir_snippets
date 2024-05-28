defmodule Db do
  @moduledoc false
  alias Db.Postgres

  def get_customer({:id, id}) do
    Postgres.get_customer_by_id(id)
  end

  def get_customer({:name, name}) do
    Postgres.get_customer_by_name(name)
  end

  def insert_customer(name, email, phone, address, registered, age) do
    Postgres.insert_customer(name, email, phone, address, registered, age)
  end

  def update_customer() do
  end

  def delete() do
  end

  def insert_10000_customers() do
    1..1000
    |> Enum.each(fn x -> insert_customer(name(x), email(x), x, address(x), false, x) end)
  end

  defp name(x) do
    "name" <> Integer.to_string(x)
  end

  defp email(x) do
    "mail@" <> Integer.to_string(x) <> ".com"
  end

  defp address(x) do
    "Address" <> Integer.to_string(x)
  end
end

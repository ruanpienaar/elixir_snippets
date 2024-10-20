defmodule Crell.Db do

  def insert(data, params, module) do
    case Crell.Repo.insert(module.changeset(data, params)) do
      {:ok, changeset} ->
        {:ok, changeset}
      {:error, changeset} ->
        {:error, changeset.errors}
    end

  end

end

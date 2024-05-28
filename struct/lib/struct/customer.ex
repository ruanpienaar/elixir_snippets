defmodule Struct.Customer do

    @version_1 "0.0.1"
    @version @version_1

  defstruct [:name, :surname, :age, version: @version]

  def new() do
    new(nil, nil, nil)
  end

  def new(name, surname, age) do
    %__MODULE__{
      name: name,
      surname: surname,
      age: age
    }
  end

  # or

  def new_pipeline(name, surname, age) do
    new()
    |> set_name(name)
    |> set_surname(surname)
    |> set_age(age)
  end

  def set_name(struct, name) do
    %__MODULE__{struct | name: name}
  end

  def set_surname(struct, surname) do
    %__MODULE__{struct | surname: surname}
  end

  def set_age(struct, age) do
    %__MODULE__{struct | age: age}
  end

  def get_name(%__MODULE__{name: name}) do
    name
  end

  def get_surname(%__MODULE__{surname: surname}) do
    surname
  end

  def get_age(%__MODULE__{age: age}) do
    age
  end
  def get_age2(struct) do
    struct.age
  end

end

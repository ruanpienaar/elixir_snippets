defmodule DuckTest do
  use ExUnit.Case
  doctest Duck

  test "greets the world" do
    assert Duck.hello() == :world
  end
end

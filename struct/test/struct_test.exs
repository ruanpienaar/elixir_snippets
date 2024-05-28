defmodule StructTest do
  use ExUnit.Case
  doctest Struct

  test "greets the world" do
    assert Struct.hello() == :world
  end
end

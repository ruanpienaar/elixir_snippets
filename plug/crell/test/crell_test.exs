defmodule CrellTest do
  use ExUnit.Case
  doctest Crell

  test "greets the world" do
    assert Crell.hello() == :world
  end
end

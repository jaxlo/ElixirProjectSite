defmodule ProjectsiteTest do
  use ExUnit.Case
  doctest Projectsite

  test "greets the world" do
    assert Projectsite.hello() == :world
  end
end

defmodule AstroTest do
  use ExUnit.Case
  doctest Astro

  test "greets the world" do
    assert Astro.hello() == :world
  end
end

defmodule Se01dojo2024Test do
  use ExUnit.Case
  doctest Se01dojo2024
  alias Se01dojo2024, as: Dojo

  test "greets the world" do
    assert Dojo.hello() == :world
  end

  test "map a function over a list of lists" do
    plusOneFunction = fn x -> x + 1 end
    lists = [[0, 1, 2], [10, 11, 12], [20, 21, 22]]

    assert Dojo.gridMap(plusOneFunction, lists) == [[1, 2, 3], [11, 12, 13], [21, 22, 23]]
  end
end

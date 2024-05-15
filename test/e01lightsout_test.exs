defmodule E01lightsoutTest do
  use ExUnit.Case
  alias E01Lightsout, as: Game

  test "starting a game renders a 3x3 grid with all lights off" do
    result =
      Game.start()
      |> Game.render()

    assert result == [
             [0, 0, 0],
             [0, 0, 0],
             [0, 0, 0]
           ]
  end

  test "toggleLight updates the light at a given position" do
    result =
      Game.start()
      |> Game.toggleLight(2, 2)
      |> Game.render()

    assert result == [
             [0, 0, 0],
             [0, 1, 0],
             [0, 0, 0]
           ]
  end

  test "toggle adjacent neighbors" do
    result =
      Game.start()
      |> Game.toggle_adjacent_neighbors(2, 2)
      |> Game.render()

    assert result == [
             [0, 1, 0],
             [1, 0, 1],
             [0, 1, 0]
           ]
  end

  test "doing a move toggles the selected light and adjacent neighbors" do
    result =
      Game.start()
      |> Game.move(2, 2)
      |> Game.render()

    assert result == [
             [0, 1, 0],
             [1, 1, 1],
             [0, 1, 0]
           ]
  end

  test "doing a move on the edge doesn't add out of bound fields" do
    result =
      Game.start()
      |> Game.move(3, 3)
      |> Game.render()

    assert result == [
             [0, 0, 0],
             [0, 0, 1],
             [0, 1, 1]
           ]
  end

  test "wining the game wins the game" do
    gameboard = [
      [1, 1, 1],
      [1, 1, 0],
      [1, 0, 0]
    ]

    result =
      Game.move(gameboard, 3, 3)
      |> Game.render()

    assert result == "Game Won"
  end
end

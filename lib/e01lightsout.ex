defmodule E01Lightsout do
  @moduledoc """
  Exercise 1: lights out.

  Game Description
  Write a piece of softvvare which allows you to play the logic puzzle Lights Out. The game is played
  on a 3x3 grid. Each cell in the grid represents a Light, that can be either on or off. The game starts
  with some or all lights turned on. The player's task is to switch off all lights. This would be easy, if
  each light can be turned off individually - however - each time you toggle a light all its neighbors
  will be toggled as well.
  """

  @doc """
  startGame/0 returns an empty game board
  """
  def start do
    gameboard = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    gameboard
  end

  def move(gameboard, row, col) do
    newBoard = toggleLight(gameboard, row, col)
    newBoard = toggle_adjacent_neighbors(newBoard, row, col)
    newBoard
    # case newBoard do
    #   [[1, 1, 1], [1, 1, 1], [1, 1, 1]] -> "Game Won"
    #   _ -> newBoard
    # end
  end

  ###################
  # Helper Functions
  def toggleLight(gameboard, row, col) do
    newBoard =
      case getLightStatus(gameboard, row, col) do
        0 -> updateLight(gameboard, row, col, 1)
        1 -> updateLight(gameboard, row, col, 0)
      end

    newBoard
  end

  def toggle_adjacent_neighbors(gameboard, row, col) do
    newBoardUp = toggleLight(gameboard, max(1, row - 1), col)
    newBoardDown = toggleLight(newBoardUp, min(3, row + 1), col)
    newBoardLeft = toggleLight(newBoardDown, row, max(1, col - 1))
    newBoard = toggleLight(newBoardLeft, row, min(3, col + 1))

    newBoard
  end

  defp updateLight(gameboard, row, col, val) do
    row1 = Enum.at(gameboard, 0)
    row2 = Enum.at(gameboard, 1)
    row3 = Enum.at(gameboard, 2)

    case row do
      1 -> [updateRow(row1, col, val), row2, row3]
      2 -> [row1, updateRow(row2, col, val), row3]
      3 -> [row1, row2, updateRow(row3, col, val)]
    end
  end

  defp updateRow(row, col, val) do
    col1 = Enum.at(row, 0)
    col2 = Enum.at(row, 1)
    col3 = Enum.at(row, 2)

    case col do
      1 -> [val, col2, col3]
      2 -> [col1, val, col3]
      3 -> [col1, col2, val]
    end
  end

  defp getLightStatus(gameboard, row, col) do
    Enum.at(Enum.at(gameboard, row - 1), col - 1)
  end

  def render(gameboard) do
    case gameboard do
      [[1, 1, 1], [1, 1, 1], [1, 1, 1]] ->
        IO.puts("Game Won")
        "Game Won"

      _ ->
        gameboard
        |> Enum.each(fn row ->
          IO.puts(Enum.join(row))
          IO.puts("---")
        end)

        IO.puts("")
        gameboard
    end
  end
end

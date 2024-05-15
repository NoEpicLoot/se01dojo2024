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
  startGame/0 returns an empty 3x3 game board
  """
  def start do
    [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  end
  @doc """
  startGame/1 returns an empty game board with the given size
  """
  def start(size) do
    gameboard = Enum.map(1..size, fn _ ->
      Enum.map(1..size, fn _ ->
        0
      end)
    end)
    gameboard
  end

  @doc """
  startGame/1 returns an empty game board with the given size
  """
  def start(rows, cols) do
    gameboard = Enum.map(1..rows, fn _ ->
      Enum.map(1..cols, fn _ ->
        0
      end)
    end)
    gameboard
  end

  def move(gameboard, row, col) do
    newBoard =
      toggleLight(gameboard, row, col)
      |> toggle_adjacent_neighbors(row, col)

    newBoard
  end

  ###################
  # Helper Functions
  def toggleLight(gameboard, row, col) do
    newBoard =
      case getLightStatus(gameboard, row, col) do
        0 -> setLightStatus(gameboard, row, col, 1)
        1 -> setLightStatus(gameboard, row, col, 0)
      end

    newBoard
  end

  def toggle_adjacent_neighbors(gameboard, row, col) do
      newBoard =
      toggleLight(gameboard, max(1, row - 1), col)
      |> toggleLight(min(getBoardSize(gameboard), row + 1), col)
      |> toggleLight(row, max(1, col - 1))
      |> toggleLight(row, min(getBoardSize(gameboard), col + 1))

      newBoard
    end

  defp setLightStatus(gameboard, row, col, val) do
    ## authored by copilot
    Enum.with_index(gameboard)
    |> Enum.map(fn {row_data, index} ->
      if index == row - 1 do
        Enum.with_index(row_data)
        |> Enum.map(fn {cell, idx} ->
          if idx == col - 1 do
            val
          else
            cell
          end
        end)
      else
        row_data
      end
    end)
  end


  defp getLightStatus(gameboard, row, col) do
    Enum.at(Enum.at(gameboard, row - 1), col - 1)
  end

  defp getBoardSize(gameboard) do
    Enum.count(Enum.at(gameboard, 0))
  end

  defp won?(gameboard) do
    # authored by copilot
    Enum.all?(gameboard, fn row ->
      Enum.all?(row, fn cell ->
        cell == 1
      end)
    end)
  end

  def render(gameboard) do
    case won?(gameboard) do
      true ->
        IO.puts("Game Won")
        "Game Won"

      false ->
        gameboard
        |> Enum.each(fn row ->
          IO.puts(Enum.join(row, "|"))
          IO.puts("-" <> String.duplicate("-", Enum.count(row) * 2 - 1)) # string duplicate authored by copilot
        end)

        IO.puts("")
        gameboard
    end
  end
end

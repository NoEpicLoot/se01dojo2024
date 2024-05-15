defmodule Se01dojo2024 do
  @moduledoc """
  Documentation for `Se01dojo2024`.

  excercises done as preparation for the coding dojo
  """

  @doc """
  Hello world.

  ## Examples

      iex> Se01dojo2024.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  gridMap/2
  maps a function over a list of lists.
  """
  def gridMap(function, lists) do
    lists
    |> Enum.map(fn inner_list ->
      inner_list |> Enum.map(function)
    end)
  end
end

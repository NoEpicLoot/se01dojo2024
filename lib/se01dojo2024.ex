defmodule Se01dojo2024 do
  @moduledoc """
  Documentation for `Se01dojo2024`.
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

  # def toTable(data, headers \\ false, index \\ false) do
  #   tableHeader =
  #     case headers do
  #       # build headers
  #       true -> "true"
  #       false -> ""
  #     end

  #   table_content = tableHeader
  #   "<table>" <> table_content <> "</table>"
  # end

  # defp build_table_row(row_data, cell_tag) do
  #   row_data
  #   |> Enum.map(fn cell -> "<#{cell_tag}>#{cell}</#{cell_tag}>" end)
  #   |> Enum.join("")
  #   |> Kernel.<>("</tr>")
  #   |> Kernel.<>("<tr>")
  # end

  # defp build_table_body(data, true) do
  #   Enum.with_index(data)
  #   |> Enum.map(fn {row, idx} -> build_table_row([idx + 1 | row], "td") end)
  #   |> Enum.join("")
  # end

  # defp build_table_body(data, false) do
  #   data
  #   |> Enum.map(fn row -> build_table_row(row, "td") end)
  #   |> Enum.join("")
  # end
end

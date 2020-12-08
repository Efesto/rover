defmodule Turtle do
  def command(turtle, input) do
    turtle
    |> execute(input)
  end

  defp execute(turtle, "M") do
    turtle
    |> move()
  end

  defp execute(turtle, command) when command in ["L", "R"] do
    turtle
    |> rotate(command)
  end

  defp rotate(%{direction: direction, position: position}, "L") do
    %{direction: left(direction), position: position}
  end

  defp rotate(%{direction: direction, position: position}, "R") do
    %{direction: right(direction), position: position}
  end

  defp move(%{direction: "South", position: %{x: x, y: y}}) do
    %{direction: "South", position: %{x: x, y: y - 1}}
  end

  defp move(%{direction: "West", position: %{x: x, y: y}}) do
    %{direction: "West", position: %{x: x - 1, y: y}}
  end

  defp move(%{direction: "East", position: %{x: x, y: y}}) do
    %{direction: "East", position: %{x: x + 1, y: y}}
  end

  defp move(%{direction: "North", position: %{x: x, y: y}}) do
    %{direction: "North", position: %{x: x, y: y + 1}}
  end

  @directions ["North", "East", "South", "West"]

  defp direction_index(direction) do
    {_, dir_index} =
      @directions
      |> Enum.with_index()
      |> Enum.find(fn {dir, _} -> dir == direction end)

    dir_index
  end

  defp left(direction) do
    @directions
    |> Enum.at(rem(direction_index(direction) - 1, Enum.count(@directions)))
  end

  defp right(direction) do
    @directions
    |> Enum.at(rem(direction_index(direction) + 1, Enum.count(@directions)))
  end
end

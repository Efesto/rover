defmodule Turtle do
  def command(turtle, input) do
    turtle
    |> execute(input)
  end

  defp execute(%{direction: "North", position: %{x: x, y: y}}, "M") do
    %{direction: "North", position: %{x: x, y: y + 1}}
  end

  defp execute(turtle, "M") do
   turtle
   |> move()
  end

  defp move(%{direction: direction, position: %{x: x, y: y}}) when direction in ["East", "West"] do
    if direction == "West" do
      %{direction: direction, position: %{x: x - 1, y: y}}
    else
      %{direction: direction, position: %{x: x + 1, y: y}}
    end
  end

  defp execute(%{direction: "North", position: %{x: x, y: y}}, "L") do
    %{direction: "West", position: %{x: x, y: y}}
  end

  defp execute(%{direction: "West", position: %{x: x, y: y}}, "R") do
    %{direction: "North", position: %{x: x, y: y}}
  end

  defp execute(%{direction: "North", position: %{x: x, y: y}}, "R") do
    %{direction: "East", position: %{x: x, y: y}}
  end
end

defmodule TurtleBatcher do
  def loop(turtle, ["Q"|_]) do
    # I'm done
  end

  def loop(turtle, [last|others]) do
    Turtle.command(turtle, last)
    |> loop(others)
  end
end

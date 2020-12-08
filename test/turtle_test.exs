defmodule TurtleTest do
  use ExUnit.Case
  @initial_turtle %{
    direction: "North",
    position: %{x: 0, y: 0}
  }

  test "M command" do
    @initial_turtle
    |> Turtle.command("M")
    |> assert_turtle_is(%{position: %{x: 0, y: 1}, direction: "North"})
  end

  test "M command - West" do
    %{
      direction: "West",
      position: %{x: 0, y: 0}
    }
    |> Turtle.command("M")
    |> assert_turtle_is(%{position: %{x: -1, y: 0}, direction: "West"})
  end

  test "fixture" do
    @initial_turtle
    |> command("M")
    |> assert_turtle_is(%{position: %{x: 0, y: 1}, direction: "North"})
    |> command("L")
    |> assert_turtle_is(%{position: %{x: 0, y: 1}, direction: "West"})
    |> command("M")
    |> assert_turtle_is(%{position: %{x: -1, y: 1}, direction: "West"})
    |> command("M")
    |> assert_turtle_is(%{position: %{x: -2, y: 1}, direction: "West"})
    |> command("R")
    |> assert_turtle_is(%{position: %{x: -2, y: 1}, direction: "North"})
    |> command("R")
    |> assert_turtle_is(%{position: %{x: -2, y: 1}, direction: "East"})
    |> command("M")
    |> assert_turtle_is(%{position: %{x: -1, y: 1}, direction: "East"})
#    |> command("?")
#    |> assert_turtle_is(%{position: %{x: -1, y: 1}, direction: "East"})
  end



  def assert_turtle_is(turtle, expectation) do
    assert expectation == turtle
    turtle
  end

  def command(turtle, command) do
    Turtle.command(turtle, command)
  end
end

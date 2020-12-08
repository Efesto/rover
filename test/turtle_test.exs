defmodule TurtleTest do
  use ExUnit.Case

  [
    {"North", %{x: 0, y: 1}},
    {"West", %{x: -1, y: 0}},
    {"East", %{x: 1, y: 0}},
    {"South", %{x: 0, y: -1}}
  ]
  |> Enum.each(fn {direction, position} ->
    @expected_position position
    @expected_direction direction
    @turtle %{direction: direction, position: %{x: 0, y: 0}}

    test "when facing #{@expected_direction}, move to expected position" do
      @turtle
      |> Turtle.command("M")
      |> assert_turtle_is(%{position: @expected_position, direction: @expected_direction})
    end
  end)

  @directions ["North", "West", "South", "East"]

  @directions
  |> Enum.with_index()
  |> Enum.each(fn {direction, i} ->
    @direction direction
    @expected_left Enum.at(@directions, rem(i + 1, Enum.count(@directions)))
    @expected_right Enum.at(@directions, rem(i - 1, Enum.count(@directions)))

    test "when facing #{@direction} rotate left to #{@expected_left}" do
      %{direction: @direction, position: %{x: 0, y: 0}}
      |> command("L")
      |> assert_turtle_is(%{position: %{x: 0, y: 0}, direction: @expected_left})
    end

    test "when facing #{@direction} rotate right to #{@expected_right}" do
      %{direction: @direction, position: %{x: 0, y: 0}}
      |> command("R")
      |> assert_turtle_is(%{position: %{x: 0, y: 0}, direction: @expected_right})
    end
  end)

  test "fixture" do
    %{direction: "North", position: %{x: 0, y: 0}}
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

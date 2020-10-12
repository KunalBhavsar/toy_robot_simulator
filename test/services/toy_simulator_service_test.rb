# frozen_string_literal: true

require "test_helper"

class RequestServiceTest < ActiveSupport::TestCase
  test "move east should increase x if less than max position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position - 1
    y_position = ::ToySimulatorService.max_position / 2
    direction = "east"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal (x_position + 1), service.x_position
  end

  test "move east should not increase x if equal to max position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position
    y_position = ::ToySimulatorService.max_position / 2
    direction = "east"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal x_position, service.x_position
  end

  test "move north should increase y if less than max position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position - 1
    direction = "north"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal (y_position + 1), service.y_position
  end

  test "move north should not increase y if equal to max position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position
    direction = "north"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal y_position, service.y_position
  end

  test "move west should decrease x if greater than min position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.min_position + 1
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal (x_position - 1), service.x_position
  end

  test "move west should not decrease x if equal to min position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.min_position
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal x_position, service.x_position
  end

  test "move south should decrease y if greater than min position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.min_position + 1
    direction = "south"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal (y_position - 1), service.y_position
  end

  test "move south should not decrease y if equal to min position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.min_position
    direction = "south"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal y_position, service.y_position
  end

  test "move south should not change x" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "south"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal x_position, service.x_position
  end

  test "move north should not change x" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "north"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal x_position, service.x_position
  end

  test "move east should not change y" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "east"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal y_position, service.y_position
  end

  test "move west should not change y" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal y_position, service.y_position
  end

  test "turn left from south should be east" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "south"
    service.place(x_position, y_position, direction)
    service.turn "left"
    assert_equal "east", service.direction
  end

  test "turn left from east should be north" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "east"
    service.place(x_position, y_position, direction)
    service.turn "left"
    assert_equal "north", service.direction
  end

  test "turn left from north should be west" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "north"
    service.place(x_position, y_position, direction)
    service.turn "left"
    assert_equal "west", service.direction
  end

  test "turn left from west should be south" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    service.turn "left"
    assert_equal "south", service.direction
  end

  test "turn right from south should be west" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "south"
    service.place(x_position, y_position, direction)
    service.turn "right"
    assert_equal "west", service.direction
  end

  test "turn right from east should be north" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "east"
    service.place(x_position, y_position, direction)
    service.turn "right"
    assert_equal "south", service.direction
  end

  test "turn right from north should be west" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "north"
    service.place(x_position, y_position, direction)
    service.turn "right"
    assert_equal "east", service.direction
  end

  test "turn right from west should be south" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    service.turn "right"
    assert_equal "north", service.direction
  end

  test "turn left should not change position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    service.turn("left")
    assert_equal x_position, service.x_position
    assert_equal y_position, service.y_position
  end

  test "turn right should not change position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    service.turn("right")
    assert_equal x_position, service.x_position
    assert_equal y_position, service.y_position
  end

  test "ignore invalid x position of first place" do
    service = ::ToySimulatorService.instance
    service.reset
    invalid_x_position = ::ToySimulatorService.max_position + 1
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(invalid_x_position, y_position, direction)
    assert_nil service.x_position
  end

  test "ignore invalid y position of first place" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    invalid_y_position = ::ToySimulatorService.max_position + 1
    direction = "west"
    service.place(x_position, invalid_y_position, direction)
    assert_nil service.y_position
  end

  test "ignore invalid direction of first place" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    invalid_direction = "up"
    service.place(x_position, y_position, invalid_direction)
    assert_nil service.direction
  end

  test "ignore invalid x position place if already placed" do
    service = ::ToySimulatorService.instance
    service.reset
    valid_x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(valid_x_position, y_position, direction)
    invalid_x_position = ::ToySimulatorService.max_position + 1
    service.place(invalid_x_position, y_position, direction)
    assert_equal valid_x_position, service.x_position
  end

  test "ignore invalid y position place if already placed" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    valid_y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, valid_y_position, direction)
    invalid_y_position = ::ToySimulatorService.max_position + 1
    service.place(x_position, invalid_y_position, direction)
    assert_equal valid_y_position, service.y_position
  end

  test "ignore invalid direction place if already placed" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    valid_direction = "west"
    service.place(x_position, y_position, valid_direction)
    invalid_direction = "up"
    service.place(x_position, y_position, invalid_direction)
    assert_equal valid_direction, service.direction
  end

  test "report should give current position" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "west"
    service.place(x_position, y_position, direction)
    assert_equal [x_position, y_position, direction.upcase].join(", "), service.report
  end

  test "report should give right position after move" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "east"
    service.place(x_position, y_position, direction)
    service.move
    assert_equal [x_position + 1, y_position, direction.upcase].join(", "), service.report
  end

  test "report should give right position after turn" do
    service = ::ToySimulatorService.instance
    service.reset
    x_position = ::ToySimulatorService.max_position / 2
    y_position = ::ToySimulatorService.max_position / 2
    direction = "east"
    service.place(x_position, y_position, direction)
    service.turn "left"
    assert_equal [x_position, y_position, "north".upcase].join(", "), service.report
  end
end

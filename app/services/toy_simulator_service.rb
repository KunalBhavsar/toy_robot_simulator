# frozen_string_literal: true

require "singleton"

class ToySimulatorService
  include Singleton

  def self.max_position
    5
  end

  def self.min_position
    1
  end

  def self.positions
    (::ToySimulatorService.min_position..::ToySimulatorService.max_position).to_a
  end

  def self.directions
    %w[south west north east]
  end

  def self.turns
    %w[left right]
  end

  def place(x_position, y_position, direction)
    valid_place = valid_place?(x_position, y_position, direction)
    if valid_place
      @x_position = x_position
      @y_position = y_position
      @direction = direction
      @toy_placed = true
    end
    add_action("place(#{x_position}, #{y_position}, #{direction})", valid_place, current_position)
  end

  def reset
    @x_position, @y_position, @direction = nil
    @toy_placed = false
    @actions = []
  end

  def turn(towards)
    if toy_placed
      valid_turn = valid_turn?(towards)
      @direction = core_hash[direction.downcase][towards.downcase] if valid_turn
    end
    add_action("turn(#{towards})", valid_turn, current_position)
  end

  def move
    if toy_placed
      direction_hash = direction_hash(direction)
      new_x_position = x_position + direction_hash["move_x"]
      new_y_position = y_position + direction_hash["move_y"]
      valid_move = valid_position?(new_x_position, new_y_position)
      if valid_move
        @x_position = new_x_position
        @y_position = new_y_position
      end
    end
    add_action("move", valid_move, current_position)
  end

  def report
    return "PLACE TOY" unless toy_placed

    current_position.map {|param| param.to_s.upcase }.join(", ")
  end

  def actions
    @actions ||= []
    return ["NO ACTION DEFINED"] if @actions.blank?

    @actions.map {|action| build_message_for_action(action[:action], action[:valid], action[:data]) }
  end

  attr_reader :x_position, :y_position, :direction, :toy_placed

  private

  def current_position
    [x_position, y_position, direction]
  end

  def valid_place?(x_position, y_position, direction)
    valid_position?(x_position, y_position) && valid_direction?(direction)
  end

  def valid_position?(x_position, y_position)
    ::ToySimulatorService.positions.include?(x_position) &&
      ::ToySimulatorService.positions.include?(y_position)
  end

  def valid_direction?(direction)
    ::ToySimulatorService.directions.include?(direction.downcase)
  end

  def valid_turn?(turn)
    ::ToySimulatorService.turns.include?(turn.downcase)
  end

  def add_action(action, valid=true, data=[])
    @actions << {action: action, valid: valid, data: data}
  end

  def build_message_for_action(action, valid, params=[])
    message = [action.upcase]
    message << "INVALID ACTION" unless valid
    message << params.map {|param| param.to_s.upcase }.join(", ") if valid && params.present?
    message.join(" : ")
  end

  def direction_hash(direction)
    core_hash[direction.downcase]
  end

  def core_hash # rubocop:disable Metrics/MethodLength
    @core_hash ||= {
      south: {
        left:   "east",
        right:  "west",
        move_x: 0,
        move_y: -1
      },
      west:  {
        left:   "south",
        right:  "north",
        move_x: -1,
        move_y: 0
      },
      north: {
        left:   "west",
        right:  "east",
        move_x: 0,
        move_y: 1
      },
      east:  {
        left:   "north",
        right:  "south",
        move_x: 1,
        move_y: 0
      }
    }.with_indifferent_access
  end
end

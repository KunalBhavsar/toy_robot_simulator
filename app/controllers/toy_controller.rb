# frozen_string_literal: true

class ToyController < ApplicationController
  def index
    @service = ToySimulatorService.instance
    render :index
  end

  def place
    @service = ToySimulatorService.instance
    @service.place(params[:x_position].to_i, params[:y_position].to_i, params[:direction])
    render :index
  end

  def move
    @service = ToySimulatorService.instance
    @service.move
    render :index
  end

  def turn_left
    @service = ToySimulatorService.instance
    @service.turn 'left'
    render :index
  end

  def turn_right
    @service = ToySimulatorService.instance
    @service.turn 'right'
    render :index
  end

  def reset
    @service = ToySimulatorService.instance
    @service.reset
    render :index
  end
end

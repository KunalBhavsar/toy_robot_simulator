# frozen_string_literal: true

class ToyController < ApplicationController
  def index
    service
    render :index
  end

  def place
    service.place(params[:x_position].to_i, params[:y_position].to_i, params[:direction])
    render :index
  end

  def move
    service.move
    render :index
  end

  def turn_left
    service.turn 'left'
    render :index
  end

  def turn_right
    service.turn 'right'
    render :index
  end

  def reset
    service.reset
    render :index
  end

  def service
    @service = ToySimulatorService.instance
  end
end

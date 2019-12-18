# frozen_string_literal: true

class TalksController < ApplicationController
  include CurrentUserConcern
  def create
    @talk = Talk.new(talk_params)
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    render json: Talk.all
  end

  def show
    @talk = Talk.find(params[:id])
    render json: @talk
  end

  def index
    @talks = Talk.all
    render json: {
      data: @talks,
      id: @current_user
    }
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :description, :location,
                                 :endTime, :startTime, :speakers)
  end
end

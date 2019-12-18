# frozen_string_literal: true

class SchedulesController < ApplicationController
  include CurrentUserConcern
  def create
    @schedule = Schedule.create(schedule_params)
    schedules = Talk.joins(:schedules).where(schedules: { user_id: schedule_params[:user_id] })
      .distinct.order(startTime: :desc)
    render json: schedules
  end

  def index
    schedules = Talk.joins(:schedules).where(schedules: { user_id: params[:id] }).distinct.order(startTime: :desc)
    render json: schedules
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    render json: Talk.left_outer_joins(:schedules).where(schedules: { user_id: params[:id] }).distinct
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :talk_id)
  end
end

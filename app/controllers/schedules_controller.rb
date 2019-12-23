# frozen_string_literal: true

class SchedulesController < ApplicationController
  include CurrentUserConcern
  def create
    @schedule = Schedule.create(schedule_params)
    schedules = Talk.joins(:schedules).where(schedules: { user_id: schedule_params[:user_id] })
      .distinct.order(startTime: :desc)
    render json: schedules, except: %i[created_at updated_at]
  end

  def index
    schedules = Schedule.joins(:talks).where(schedules: { user_id: params[:user_id] }).distinct.order(startTime: :desc)
    render json: schedules, except: %i[created_at updated_at]
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    schedules = Talk.joins(:schedules).where(schedules: { user_id: schedule_params[:user_id] })
      .distinct.order(startTime: :desc)
    render json: schedules, except: %i[created_at updated_at]
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :talk_id)
  end
end

class SchedulesController < ApplicationController
  include CurrentUserConcern
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      schedules = Talk.joins(:schedules).where(schedules: { user_id: schedule_params[:user_id] }).distinct
      render :json => schedules
    end
  end

  def index
    schedules = Talk.joins(:schedules).where(schedules: { user_id: params[:id] }).distinct
    render :json => schedules
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    render :json => Talk.left_outer_joins(:schedules).where(schedules: { user_id: params[:id] }).distinct

  end

  private
  def schedule_params
    params.require(:schedule).permit(:user_id, :talk_id)
  end
end


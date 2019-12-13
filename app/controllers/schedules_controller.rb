class SchedulesController < ApplicationController
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      render :json => Talk.left_outer_joins(:schedules).where(schedules: {user_id: params[:user_id] }).distinct
    end
  end

  def index
    schedules = Talk.left_outer_joins(:schedule).where(schedule: {user_id: params[:user_id] }).distinct unless !@schedule.save
    render :json => schedules
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    render :json => Talk.left_outer_joins(:schedule).where(schedule: {user_id: params[:user_id] }).distinct unless !@schedule.save

  end

  private
  def schedule_params
    params.require(:schedule).permit(:user_id, :talk_id)
  end
end


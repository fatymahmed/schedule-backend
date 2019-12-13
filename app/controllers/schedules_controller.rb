class SchedulesController < ApplicationController
  def create
    @schedule = Schedule.new(schedule_params)
    render :json => Schedule.left_outer_joins(:schedules).where(schedules: {user_id: {@current_user.id}}).distinct unless !@schedule.save
  end

  def index
    schedules = Schedule.left_outer_joins(:schedules).where(schedules: {user_id: {@current_user.id}}).distinct
    render :json => schedules
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    render :json => Schedule.left_outer_joins(:schedules).where(schedules: {user_id: {@current_user.id}}).distinct

  end

  private
  def schedule_params
    params.require(:schedule).permit(user_id, talk_id)
  end
end


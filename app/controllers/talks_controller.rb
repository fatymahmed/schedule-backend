class TalksController < ApplicationController
  def create
    @talk = Talk.new(talk_params)
    render :json => Taalk.all unless !@talk.save
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    render :json => Talk.all
  end

  def show
    @talk = Talk.find(params[:id])
    render :json => @talk
  end

  def index
    @talks = Talk.all
    render :json => @talks
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :description, :location,
                                 :endTime, :startTime, :speakers)
  end
end

# frozen_string_literal: true

class TalksController < ApplicationController
  def index
    @talks = Talk.all
    render json: {
      data: @talks
    }, except: %i[created_at updated_at]
  end
end

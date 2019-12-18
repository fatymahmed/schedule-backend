# frozen_string_literal: true

class StaticController < ApplicationController
  def home
    render json: { status: "it's working" }
  end
end

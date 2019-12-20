# frozen_string_literal: true

class Talk < ApplicationRecord
  serialize :speakers, Array
  has_many :schedules
  has_many :users, through: :schedules
end

# frozen_string_literal: true

class Talk < ApplicationRecord
  serialize :speakers, Array
  has_many :schedules
  has_many :users, through: :schedules
  validates_presence_of :title, :location, :startTime, :endTime
  validates_uniqueness_of :title
end

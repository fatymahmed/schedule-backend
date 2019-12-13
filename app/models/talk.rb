class Talk < ApplicationRecord
  serialize :speakers, Array
  has_many :schedules
  has_many :talks, through: :schedules
end

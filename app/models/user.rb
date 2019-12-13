class User < ApplicationRecord
  has_secure_password
  has_many :schedules
  has_many :talks, through: :schedules
  validates_presence_of :email
  validates_uniqueness_of :email
end

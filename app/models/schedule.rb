# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :talk
end

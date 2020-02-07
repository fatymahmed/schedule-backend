class AddTalkToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :talk, null: false, foreign_key: true
  end
end

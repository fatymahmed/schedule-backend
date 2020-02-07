class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :startTime
      t.datetime :endTime
      t.text :speakers

      t.timestamps
    end
  end
end

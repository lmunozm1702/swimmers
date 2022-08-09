class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_proof, null: false
      t.date :event_date, null: false
      t.string :event_gender, null: false
      t.string :event_type, null: false
      t.time :seed_time, null: false
      t.time :event_time

      t.timestamps
    end
  end
end

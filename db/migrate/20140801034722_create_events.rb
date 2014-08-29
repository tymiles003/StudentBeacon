class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :code
      t.string :day
      t.integer :event_start
      t.integer :event_end
      t.timestamps
    end
  end
end

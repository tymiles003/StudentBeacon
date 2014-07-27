class CreateActivity < ActiveRecord::Migration
  def change

    create_table :activity do |t|
      t.string :username
      t.string :beaconid
      t.string :event
      t.string :description
      t.string :owner
      t.datetime :event_time
      t.timestamps
    end

    create_table :notification do |t|
      t.string :username
      t.string :message
      t.string :beaconid
      t.datetime :between_start
      t.datetime :between_end
      t.timestamps
    end
  end
end

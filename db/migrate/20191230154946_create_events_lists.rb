class CreateEventsLists < ActiveRecord::Migration[6.0]
  def change
    create_table :events_lists do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.string :start_time
      t.string :end_time
      t.string :yelp_id
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end

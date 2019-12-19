class CreateCreateContactTables < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :owner, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end

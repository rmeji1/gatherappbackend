class CreateTableUserNotificationsData < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_data do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :endpoint
      t.string :p256dh_key
      t.string :auth_key
    end
  end
end

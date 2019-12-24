class User < ApplicationRecord
  has_secure_password
  validates :username, length:{minimum: 4, message: "must be longer than 4 characters."}, uniqueness: {message: "has already been taken. Try another username."}
  validates :password, length: { in: 6..20 }
  has_many :events
  has_many :contacts, class_name: 'Contact', foreign_key: 'owner_id'
  has_many :notification_data
end

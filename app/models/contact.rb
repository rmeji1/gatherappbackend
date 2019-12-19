class Contact < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: "owner_id"
  belongs_to :user, class_name: 'User', foreign_key: "user_id"
end

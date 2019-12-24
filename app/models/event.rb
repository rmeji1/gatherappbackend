class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :invitations, dependent: :destroy
  # has_many :invitees, class_name: 'Invitation', foreign_key: 'user_id'
end

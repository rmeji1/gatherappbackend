class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_one :event
  has_one :user
end

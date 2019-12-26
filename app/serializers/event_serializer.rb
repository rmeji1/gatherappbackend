class EventSerializer < ActiveModel::Serializer
  has_many :invitations, serializer: InvitationSerializer
  # has_one :user

  attributes :id, :title, :description, :creator_name, :invitations

  def creator_name 
    self.object.creator.username || User.find(self.object.user_id).username
  end
end

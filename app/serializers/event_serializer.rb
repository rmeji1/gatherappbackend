class EventSerializer < ActiveModel::Serializer
  has_many :invitations, serializer: InvitationSerializer
  has_many :events_lists
  attributes :id, :title, :description, :creator_id, :creator_name, :invitations

  def creator_name 
    self.object.creator.username || User.find(self.object.user_id).username
  end
  
  def creator_id
    self.object.creator.id 
  end
end

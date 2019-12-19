class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :creator_name, :invitations
  # has_one :user

  def creator_name 
    self.object.creator.username
  end
end

class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :creator_name
  # has_one :user
  has_many :invitations

  def creator_name 
    self.object.creator.username
  end
end

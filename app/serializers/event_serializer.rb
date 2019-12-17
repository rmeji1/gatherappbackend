class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :creator_name
  # has_one :user

  def creator_name 
    self.object.user.username
  end
end

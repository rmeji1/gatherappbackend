class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :confirmed, :event_creator, :event_title, :event_description
  has_one :event

  def event_creator
    self.object.event.creator.username
  end

  def event_title
    self.object.event.title
  end

  def event_description
    self.object.event.description
  end
end

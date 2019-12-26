class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :contacts, :invitations

  def contacts 
    self.object.contacts.map do |contact|
      contact.user
    end
  end
end

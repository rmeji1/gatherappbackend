class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :contacts

  def contacts 
    self.object.contacts.map do |contact|
      contact.user
    end
  end
end

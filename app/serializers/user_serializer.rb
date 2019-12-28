class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :contacts
  has_many :invitations
  
  def contacts 
    self.object.contacts.map do |contact|
      contact.user
    end
  end
end

class ContactsController < ApplicationController
  before_action :require_login
  def create
    contact = Contact.create(create_contact_params)
    if contact.valid?
      render json: contact.user
    else
      render json: {error: 'contact is not valid'}
    end
  end

  private 
  def create_contact_params
    {
      owner_id: params.require(:owner_id),
      user_id: params.require(:user_id)
    }
  end

  def contact_params
    # params.require(:user_id, :id)
  end
end
class InvitationsController < ApplicationController
  def index
    event_id = params[:event_id]
    
  end

  def create
    invitation = Invitation.create(invitation_params)
    if invitation.valid?
      render json: invitation, status: :ok
    else
      render json: {error: invitation.error.messages}, status: :not_found
    end
  end

  private 
  def invitation_params
    params.require(:invitation).permit(:user_id).merge(params.permit(:event_id))
  end
end

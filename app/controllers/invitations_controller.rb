class InvitationsController < ApplicationController
  def index
    render json: User.find(params[:user_id]).invitations if params[:user_id].present?
    render json: Event.find(params[:event_id]).invitations if params[:event_id].present?
  end

  def create
    invitation = Invitation.create(invitation_params)
    if invitation.valid?
      PushService.sendPush(User.find(invitation.user_id), JSON.generate({"type": "ADD_INVITATION", "invitation": InvitationSerializer.new(invitation).as_json}))
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

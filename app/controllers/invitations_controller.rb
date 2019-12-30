class InvitationsController < ApplicationController
  def index
    render json: User.find(params[:user_id]).invitations if params[:user_id].present?
    render json: Event.find(params[:event_id]).invitations if params[:event_id].present?
  end

  def create
    begin 
      invitation = Invitation.create!(invitation_params)
      PushService.sendPush(User.find(invitation.user_id), JSON.generate({"type": "ADD_INVITATION", "invitation": InvitationSerializer.new(invitation).as_json}))
      render json: invitation , status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: {error: e.messages}, status: :not_found
    end
  end

  def update
    begin
      invite = Invitation.find(params[:id])
      invite.update!(invitation_params)
      render json: invite, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: {error: "Record invalid, could not update invitation!"}, status: :bad_request
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: "Invtation with id not found"}, status: :not_found
    end
  end

  private 
  def invitation_params
    params.require(:invitation).permit(:user_id, :confirmed).merge(params.permit(:event_id))
  end
end

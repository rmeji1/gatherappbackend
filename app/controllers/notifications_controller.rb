class NotificationsController < ApplicationController
 #<NotificationDatum id: nil, user_id: nil, endpoint: nil, p256dh_key: nil, auth_key: nil> 
  def create
    notificationData = NotificationDatum.new
    notificationData.endpoint = params["endpoint"]
    notificationData.p256dh_key = params["keys"]["p256dh"]
    notificationData.auth_key = params["keys"]["auth"]
    notificationData.user_id = params["user_id"]
    notificationData.save
    if notificationData.valid?
      render json: {success: 'Added'}, status: :ok
    else
      render json: {error: notificationData.error.messages}, status: :internal_server_error
    end
  end
end

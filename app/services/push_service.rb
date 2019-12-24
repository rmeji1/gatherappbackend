class PushService 

  def self.sendPush(user, message)
    if !user.notification_data.empty?
      user.notification_data.each do |notification_datum|
        begin
          Webpush.payload_send(endpoint: notification_datum.endpoint,
          message: message,
          p256dh: notification_datum.p256dh_key,
          auth: notification_datum.auth_key,
          ttl: 24 * 60 * 60,
          vapid: {
              subject: 'mailto:robertmejia30@gmail.com',
              public_key: ENV["vapid_public_key"],
              private_key: ENV["vapid_private_key"]
          }
        )
        rescue Webpush::ExpiredSubscription => e
          notification_datum.destroy
        end
      end
    end
  end
end
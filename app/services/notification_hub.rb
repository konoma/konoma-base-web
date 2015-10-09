class NotificationHub

	FORMAT_ANDROID = 'gcm'
	FORMAT_IOS = 'apple'
	FORMATS = [FORMAT_ANDROID, FORMAT_IOS]

	def send_notification(channels, message, data)
		ap = Azure::Push::Message.new(ENV['MS_NOTIFICATION_HUB_NAMESPACE'], ENV['MS_NOTIFICATION_HUB_HUB'], ENV['MS_NOTIFICATION_HUB_ACCESS_KEY'])

		FORMATS.each do |f|
			response = ap.send(build_message(message, data, f), channels, format: f)

			# noinspection RubyControlFlowConversionInspection
			if not response == true
				Rails.logger.error("MS Notification Hub sending failed: #{response.code} / #{response.message} / #{response.body}")
			end
		end
	end

	private

	def build_message(message, data, format)
		if format == FORMAT_ANDROID
			m = {
				data: {
					alert: message
				}
			}

			data.each do |d|
				m[:data].merge!(d)
			end
		else
			m = {
				aps: {
					alert: message
				}
			}

			data.each do |d|
				m.merge!(d)
			end
		end

		m
	end

end
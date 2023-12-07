# frozen_string_literal: true

class EmailLogger
  def self.log_email(recipient_email, email_subject, body, sent_at = Time.current)
    EmailLog.create!(
      recipient_email:,
      email_subject:,
      body:,
      sent_at:
    )
  rescue StandardError => e
    Rails.logger.error "Failed to log email: #{e.message}"
  end
end

class EmailLogger
    def self.log_email(recipient_email, email_subject, body, sent_at = Time.current)
      begin
        EmailLog.create!(
          recipient_email: recipient_email,
          email_subject: email_subject,
          body: body,
          sent_at: sent_at
        )
      rescue StandardError => e
        Rails.logger.error "Failed to log email: #{e.message}"
      end
    end
  end
  
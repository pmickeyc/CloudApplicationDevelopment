class EmailLog < ApplicationRecord
    validates :recipient_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :email_subject, presence: true
    validates :body, presence: true
    validates :sent_at, presence: true
end

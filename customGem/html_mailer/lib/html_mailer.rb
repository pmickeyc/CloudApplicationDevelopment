# frozen_string_literal: true

require_relative 'html_mailer/version'
require 'action_mailer'

module HtmlMailer
  class Error < StandardError; end

  class Mailer < ActionMailer::Base
    default from: 'padraig588@gmail.com'

    def send_html_email(html_content, recipient_email, subject)
      default_header_html = '<h1>Hello, Please find attached your receipt</h1><br/><br/>'
      full_html_content = default_header_html + html_content
      mail(to: recipient_email, subject:) do |format|
        format.html { render plain: full_html_content }
      end
    end
  end

  def self.send_html_email(html_content, recipient_email, subject)
    Mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      user_name: 'padraig588@gmail.com',
      password: 'pogguknbmqqinlbh',
      authentication: 'plain',
      enable_starttls_auto: true
    }
    # Mailer.default from: sender_email
    Mailer.send_html_email(html_content, recipient_email, subject).deliver_now
  end
end

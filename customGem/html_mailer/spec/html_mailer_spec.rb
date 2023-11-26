require 'spec_helper'

RSpec.describe HtmlMailer do
  describe '.send_html_email' do
    it 'sends an email with HTML content' do
      expect(Mail).to receive(:deliver)
      HtmlMailer.send_html_email('<h1>Hello World</h1>', 'recipient@example.com', 'Test Subject', 'sender@example.com')
    end
  end
end

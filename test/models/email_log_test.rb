require 'test_helper'

class EmailLogTest < ActiveSupport::TestCase
  def setup
    @email_log = EmailLog.new(
      recipient_email: "padraig588@gmail.com.com",
      email_subject: "Order Details",
      body: "<h1>sample</h1>",
      sent_at: Time.current
    )
  end

  test "should be valid" do
    assert email_log.valid?
  end

  test "recipient_email should be present" do
    email_log.recipient_email = nil
    assert_not email_log.valid?
  end

  test "email_subject should be present" do
    email_log.email_subject = nil
    assert_not email_log.valid?
  end

  test "body should be present" do
    email_log.body = nil
    assert_not email_log.valid?
  end

  test "sent_at should be present" do
    email_log.sent_at = nil
    assert_not email_log.valid?
  end
end

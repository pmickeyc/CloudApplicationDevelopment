# frozen_string_literal: true

require 'test_helper'

class EmailLogTest < ActiveSupport::TestCase
  def setup
    @email_log = email_logs(:one)
  end

  test 'should be valid' do
    assert email_logs(:one).valid?
  end

  test 'recipient_email should be present' do
    email_log = email_logs(:one)
    email_log.recipient_email = nil
    assert_not email_log.valid?
  end

  test 'email_subject should be present' do
    email_log = email_logs(:one)
    email_log.email_subject = nil
    assert_not email_log.valid?
  end

  test 'body should be present' do
    email_log = email_logs(:one)
    email_log.body = nil
    assert_not email_log.valid?
  end

  test 'sent_at should be present' do
    email_log = email_logs(:one)
    email_log.sent_at = nil
    assert_not email_log.valid?
  end

  test 'recipient_email should have valid format' do
    email_log = email_logs(:one)
    email_log.recipient_email = 'invalid-email'
    assert_not email_log.valid?, 'EmailLog is valid with an invalid email format'
  end
end

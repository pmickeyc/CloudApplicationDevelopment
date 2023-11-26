class CreateEmailLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :email_logs do |t|
      t.string :recipient_email
      t.string :email_subject
      t.text :body
      t.datetime :sent_at

      t.timestamps
    end
  end
end

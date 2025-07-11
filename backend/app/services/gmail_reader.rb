require 'net/imap'
require 'mail'

class GmailReader
  def initialize(email:, app_password:)
    @email = email
    @app_password = app_password
  end

  def fetch_subjects(limit = 10)
    imap = Net::IMAP.new('imap.gmail.com', 993, true)
    imap.login(@email, @app_password)
    imap.select('INBOX')

    ids = imap.search(['ALL']).last(limit)
    subjects = []

    ids.each do |id|
      msg = imap.fetch(id, 'RFC822')[0].attr['RFC822']
      mail = Mail.read_from_string(msg)
      subjects << mail.subject
    end

    imap.logout
    imap.disconnect

    subjects
  end
end

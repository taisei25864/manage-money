require 'net/imap'
require 'mail'
require 'date'

class GmailReader
  def initialize(email:, app_password:)
    @email = email
    @app_password = app_password
  end

  def fetch_from_sender(sender_email)
    imap = Net::IMAP.new('imap.gmail.com', 993, true)
    imap.login(@email, @app_password)
    imap.select('INBOX')
    
    today = Date.today.strftime('%d-%b-%Y')

    ids = imap.search(['SINCE', today, 'FROM', sender_email])
    messages = []

    ids.each do |id|
      msg = imap.fetch(id, 'RFC822')[0].attr['RFC822']
      mail = Mail.read_from_string(msg)

      body = if mail.multipart?
               mail.text_part ? mail.text_part.decoded : mail.html_part&.decoded
             else
               mail.body.decoded
             end

      messages << {
        subject: mail.subject,
        body: body
      }
      
    end

    imap.logout
    imap.disconnect

    messages
  end
end

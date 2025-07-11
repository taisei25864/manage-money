module Api
  class GmailController < ApplicationController
    def index
      reader = GmailReader.new(
        email: ENV['GMAIL_ADDRESS'],
        app_password: ENV['GMAIL_APP_PASSWORD']
      )
      messages = reader.fetch_from_sender("statement@vpass.ne.jp")

      render json: { messages: messages }
    end
  end
end
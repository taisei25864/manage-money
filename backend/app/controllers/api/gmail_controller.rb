module Api
  class GmailController < ApplicationController
    def index
      reader = GmailReader.new(
        email: ENV['GMAIL_ADDRESS'],
        app_password: ENV['GMAIL_APP_PASSWORD']
      )
      subjects = reader.fetch_subjects

      render json: { subjects: subjects }
    end
  end
end
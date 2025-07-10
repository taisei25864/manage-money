# app/services/gmail_fetcher.rb

require 'google/apis/gmail_v1'

class GmailFetcher
  def initialize(user)
    @user = user
    @service = Google::Apis::GmailV1::GmailService.new
    @service.authorization = user.google_token_object  # トークンの取得方法は後述
  end

  def fetch_latest_subjects(limit = 10)
    result = @service.list_user_messages('me', max_results: limit)
    result.messages.map do |message|
      msg = @service.get_user_message('me', message.id)
      msg.payload.headers.find { |h| h.name == 'Subject' }&.value
    end
  end
end

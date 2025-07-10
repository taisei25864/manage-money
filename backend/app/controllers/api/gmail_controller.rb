module Api
  class GmailController < ApplicationController
    def index
      fetcher = GmailFetcher.new(current_user)
      @subjects = fetcher.fetch_latest_subjects
    end
  end
end
# app/controllers/api/transactions_controller.rb
module Api
  class TransactionsController < ApplicationController
    def index
      transactions = Transaction.all
      render json: transactions
    end

    def create
      transaction = Transaction.create!(transaction_params)
      render json: transaction, status: :created
    end

    # def show
    #   transaction = Transaction.find(params[:id])
    #   render json: transaction
    # end
    # Gmailからデータ取得・整形・保存
    def from_gmail
      reader = GmailReader.new(
        email: ENV['GMAIL_ADDRESS'],
        app_password: ENV['GMAIL_APP_PASSWORD']
      )
      raw_messages = reader.fetch_from_sender("statement@vpass.ne.jp")

      transactions = raw_messages.map do |raw|
        Transaction.create_from_gmail(raw)
      end
      render json: transactions, status: :created
    end


    private

    def transaction_params
      params.require(:transaction).permit(:title, :name, :amount, :category, :occurred_on)
    end
  end
end

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

    private

    def transaction_params
      params.require(:transaction).permit(:name, :amount, :category, :occurred_on)
    end
  end
end

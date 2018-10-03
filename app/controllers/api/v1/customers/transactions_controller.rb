class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    ## REFACTOR ##
    invoices = Customer.find(params[:id]).invoices.
    trans = invoices.map do |invoice|
      invoice.transactions
    end
    render json: trans.flatten
  end
  ## REFACTOR ##
end

class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    render json: Transaction.all_for_customer(params[:id])
  end

end

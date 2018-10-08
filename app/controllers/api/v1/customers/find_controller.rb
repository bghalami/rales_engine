class Api::V1::Customers::FindController < ApplicationController
  def index
    render json: Customer.where(customer_params)
  end

  def show
    render json: Customer.find_by(customer_params)
  end

  private

  def customer_params
    params.permit(:id,
                  :created_at,
                  :updated_at,
                  :customer_id,
                  :merchant_id,
                  :status
                )
  end
end

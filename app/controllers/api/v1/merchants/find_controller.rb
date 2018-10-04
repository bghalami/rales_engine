class Api::V1::Merchants::FindController < ApplicationController
  def index
    render json: Merchant.where(merchant_params)
  end

  def show
    render json: Merchant.find_by(merchant_params)
  end

  private

  def merchant_params
    params.permit(:id, :created_at, :updated_at, :first_name, :last_name)
  end
end

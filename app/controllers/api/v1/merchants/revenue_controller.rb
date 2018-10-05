class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: Merchant.all
  end

  def show
    if params[:date]
    end
    render json: Merchant.find(params[:id])
  end

  private

  def revenue_params
    params.permit(:date)
  end
end

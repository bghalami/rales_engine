class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: Merchant.top_by_items(most_items_params[:quantity].to_i)
  end

  private

  def most_items_params
    params.permit(:quantity)
  end
end

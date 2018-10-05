class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: Merchant.all
  end

  private

  def most_items_params
    params.permit(:quantity)
  end
end

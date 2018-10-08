class Api::V1::Customers::FavoriteController < ApplicationController
  def show
    render json: Merchant.favorite_merchant(params[:customer_id])
  end
end

class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    render json: Customer.all
  end
end

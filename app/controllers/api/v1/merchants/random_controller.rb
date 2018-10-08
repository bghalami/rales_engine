class Api::V1::Merchants::RandomController < ApplicationController
  def show
    render json: Merchant.all.to_a.sample
  end
end

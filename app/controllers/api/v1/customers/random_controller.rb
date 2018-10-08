class Api::V1::Customers::RandomController < ApplicationController
  def show
    render json: Customer.all.to_a.sample
  end
end

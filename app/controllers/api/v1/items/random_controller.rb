class Api::V1::Items::RandomController < ApplicationController
  def show
    render json: Item.all.to_a.sample
  end
end

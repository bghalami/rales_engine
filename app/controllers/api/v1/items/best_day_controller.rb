class Api::V1::Items::BestDayController < ApplicationController
  def show
    time = Invoice.best_day_for_item(params[:item_id])
    first = time.attributes.keys[1]
    second = time.attributes.values[1]
    build = Time.parse(second.to_s).iso8601(3)
    render json: {first => build}.to_json
  end
end

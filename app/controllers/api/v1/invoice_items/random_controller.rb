class Api::V1::InvoiceItems::RandomController < ApplicationController
  def show
    render json: InvoiceItem.all.to_a.sample
  end
end

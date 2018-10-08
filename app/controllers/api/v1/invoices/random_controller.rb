class Api::V1::Invoices::RandomController < ApplicationController
  def show
    render json: Invoice.all.to_a.sample
  end
end

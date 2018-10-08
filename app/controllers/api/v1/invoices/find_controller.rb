class Api::V1::Invoices::FindController < ApplicationController
  def index
    render json: Invoice.where(invoice_params)
  end

  def show
    render json: Invoice.find_by(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :created_at, :updated_at, :first_name, :last_name)
  end
end

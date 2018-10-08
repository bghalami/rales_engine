class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def index
    render json: Customer.customers_with_pending_invoices(pending_params[:merchant_id])
  end

  private

  def pending_params
    params.permit(:merchant_id)
  end
end

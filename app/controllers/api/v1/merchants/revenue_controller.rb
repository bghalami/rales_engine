class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    if params[:date]
      hash = InvoiceItem.rev_by_date_all(params[:date])
      render json: {hash.attributes.keys[1] => hash.attributes.values[1]}.to_json
    end
  end

  def show
    if params[:date]
      hash = InvoiceItem.rev_by_date_single(params[:merchant_id], params[:date])
      render json: {hash.attributes.keys[1] => hash.attributes.values[1]}.to_json
    else
      hash = InvoiceItem.total_rev_for_merch(params[:merchant_id])
      render json: {hash.attributes.keys[1] => hash.attributes.values[1].to_s}.to_json
    end
  end
end

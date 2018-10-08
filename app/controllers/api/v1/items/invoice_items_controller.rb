class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    render json: Item.find_by_id(params[:item_id]).invoice_items
  end
end

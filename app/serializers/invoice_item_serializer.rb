class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :quantity, :unit_price, :item_id
end

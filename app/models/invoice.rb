class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoices
  has_many :invoice_items
end

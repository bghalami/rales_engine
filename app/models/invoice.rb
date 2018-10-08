class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates_presence_of :customer_id,
                        :merchant_id,
                        :status

  def self.invoices_with_a_transaction
    joins(:transactions)
  end

  def self.best_day_for_item(item_id)
    select("invoices.created_at AS best_day, SUM(invoice_items.quantity) AS sold")
    .joins(:items)
    .joins(:transactions)
    .where("invoice_items.item_id = ?", item_id)
    .group("best_day")
    .order("sold desc, best_day desc")
    .limit(1)
    .first
  end
end

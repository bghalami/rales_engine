class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :merchant_id

  def self.top_ranked_items_by_revenue(quantity = 5)
    select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoice_items)
    .joins("INNER JOIN transactions ON transactions.invoice_id = invoice_items.invoice_id")
    .where("transactions.result = 'success'")
    .group("items.id")
    .order("revenue desc")
    .limit(quantity)
  end

  def self.most_sold(quantity = 5)
    select("items.*, SUM(invoice_items.quantity) AS sold")
    .joins(:invoice_items)
    .joins("INNER JOIN transactions ON transactions.invoice_id = invoice_items.invoice_id")
    .where("transactions.result = 'success'")
    .group("items.id")
    .order("sold desc")
    .limit(quantity)
  end

end

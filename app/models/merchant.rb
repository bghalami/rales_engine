class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  validates_presence_of :name

  def self.favorite_merchant(id)
    select("merchants.id, name, count(invoices.customer_id) as count")
    .where("invoices.customer_id = #{id}")
    .joins(:invoices)
    .group(:id)
    .order(count: :desc)
    .limit(1).first
  end

  def self.most_revenue(count = 5)
    select("merchants.*, SUM(unit_price * quantity) AS revenue")
    .joins(:invoice_items)
    .group(:id)
    .order("revenue DESC")
    .limit(count)
  end

  def self.top_by_items(qty = 5)
    select("merchants.*, SUM(quantity) AS amount")
    .joins(:invoice_items)
    .joins("INNER JOIN transactions ON transactions.invoice_id = invoice_items.invoice_id")
    .where("transactions.result = 'success'")
    .group(:id)
    .order("amount desc")
    .limit(qty)
  end
end

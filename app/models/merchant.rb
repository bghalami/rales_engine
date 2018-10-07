class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  validates_presence_of :name

  def self.favorite_merchant(id)
    select("merchants.id, name, count(invoices.customer_id) as count")
    .where("invoices.customer_id = #{id}")
    .joins(:invoices)
    .group(:id)
    .order(count: :desc)
    .limit(1).first
  end

  def self.most_revenue(count)
    select("merchants.*, SUM(unit_price * quantity) AS revenue")
    .joins(:invoices)
    .joins("INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
    .group(:id)
    .order("revenue DESC")
    .limit(count)
  end
end

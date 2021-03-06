class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates_presence_of :item_id,
                        :invoice_id,
                        :quantity,
                        :unit_price

  def self.rev_by_date_all(date)
    select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice)
    .joins("INNER JOIN transactions ON invoices.id = transactions.invoice_id")
    .where("date_trunc('day',invoices.created_at) = '#{date}'AND transactions.result = 'success'")
    .group("date_trunc('day',invoices.created_at)")
    .order("date_trunc('day',invoices.created_at)")
    .first
  end

  def self.rev_by_date_single(merchant_id, date)
    select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoice)
    .joins("INNER JOIN merchants ON merchants.id = invoices.merchant_id")
    .joins("INNER JOIN transactions ON invoices.id = transactions.invoice_id")
    .where("date_trunc('day',invoices.created_at) = '#{date}' AND merchants.id = #{merchant_id} AND transactions.result = 'success'")
    .group("date_trunc('day',invoices.created_at)")
    .order("date_trunc('day',invoices.created_at)")
    .first
  end

  def self.total_rev_for_merch(merch_id)
    select("merchants.id, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoice)
    .joins("INNER JOIN merchants ON merchants.id = invoices.merchant_id")
    .joins("INNER JOIN transactions ON invoices.id = transactions.invoice_id")
    .where("merchants.id = #{merch_id} AND transactions.result = 'success'")
    .group("merchants.id")
    .order("merchants.id desc").first
  end
end

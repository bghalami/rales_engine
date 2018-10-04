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

end

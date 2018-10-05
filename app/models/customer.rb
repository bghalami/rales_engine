class Customer < ApplicationRecord
  has_many :invoices

  validates_presence_of :first_name,
                       :last_name

  def self.customers_with_pending_invoices(merchant_id)
    find_by_sql("SELECT customers.* FROM customers
        INNER JOIN invoices ON invoices.customer_id = customers.id
        INNER JOIN transactions ON transactions.invoice_id = invoices.id
        WHERE invoices.merchant_id = #{merchant_id}
        AND transactions.result = 'failed'
      EXCEPT
        SELECT customers.* FROM customers
        INNER JOIN invoices ON invoices.customer_id = customers.id
        INNER JOIN transactions ON transactions.invoice_id = invoices.id
        WHERE invoices.merchant_id = #{merchant_id}
        AND transactions.result = 'success'")
  end
end

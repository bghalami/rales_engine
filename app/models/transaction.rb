class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :invoice_id,
                        :credit_card_number,
                        :result

  def all_for_customer(id)
    joins(:invoice)
    .where("invoices.customer_id = #{id}")
  end
end

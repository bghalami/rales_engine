class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :invoice_id,
                        :credit_card_number,
                        :result,
                        :credit_card_expiration_date
end

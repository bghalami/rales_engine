FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { 1 }
    result { "MyText" }
  end
end

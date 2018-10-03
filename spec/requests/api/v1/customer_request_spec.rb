require 'rails_helper'

describe "pulling some dope info" do
  it "should return the correct information from index" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end
  it "should return information for one item" do
    customer = create(:customer).id

    get "/api/v1/customers/#{customer}"

    expect(response).to be_successful

    customer_response = JSON.parse(response.body)

    expect(customer_response["id"]).to eq(customer)
  end
  it "should return all invoices for customer" do
    customer = create(:customer).id
    merchant = create(:merchant).id
    invoice = create( :invoice,
                      customer_id: customer,
                      merchant_id: merchant
                    )
    invoice2 = create( :invoice,
                      customer_id: customer,
                      merchant_id: merchant
                    )

    get "/api/v1/customers/#{customer}/invoices"

    expect(response).to be_successful

    customer_invoice_response = JSON.parse(response.body)

    expect(customer_invoice_response[0]["id"]).to eq(invoice.id)
    expect(customer_invoice_response[1]["id"]).to eq(invoice2.id)
  end
  it "should return all transactions for customer" do
    customer = create(:customer).id
    merchant = create(:merchant).id
    invoice = create( :invoice,
                      customer_id: customer,
                      merchant_id: merchant
                    ).id
    transaction = create( :transaction,
                          invoice_id: invoice
                         )

    transaction2 = create( :transaction,
                          invoice_id: invoice
                         )

    get "/api/v1/customers/#{customer}/transactions"

    expect(response).to be_successful

    customer_transaction_response = JSON.parse(response.body)

    expect(customer_transaction_response[0]["id"]).to eq(transaction.id)
    expect(customer_transaction_response[1]["id"]).to eq(transaction2.id)
  end
end

require 'rails_helper'

describe "pulling some dope info" do
  it "should return the correct information" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful
  end
end

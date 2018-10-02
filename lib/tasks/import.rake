namespace :import do
  desc "TODO"
  task data: :environment do
    CSV.foreach("/db/data/customer.csv",headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts 'Customers Imported'
    CSV.foreach("/db/data/invoice_items.csv",headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts 'Invoice Items Imported'
    CSV.foreach("/db/data/invoices.csv",headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts 'Invoices Imported'
    CSV.foreach("/db/data/items.csv",headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts 'Items Imported'
    CSV.foreach("/db/data/merchants.csv",headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts 'Merchants Imported'
    CSV.foreach("/db/data/transactions.csv",headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts 'Transactions Imported'
  end

end

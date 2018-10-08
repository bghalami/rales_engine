require "csv"

namespace :import do
  desc "Import ALL data from CSV"
  task data: :environment do
    Rake::Task["import:destructor"].invoke
    Rake::Task["import:customers"].invoke
    Rake::Task["import:merchants"].invoke
    Rake::Task["import:items"].invoke
    Rake::Task["import:invoices"].invoke
    Rake::Task["import:invoice_items"].invoke
    Rake::Task["import:transactions"].invoke
  end

  desc "Destroy All Tables"
  task destructor: :environment do
    Transaction.destroy_all
    InvoiceItem.destroy_all
    Invoice.destroy_all
    Item.destroy_all
    Customer.destroy_all
    Merchant.destroy_all
  end

  desc "Import customers from CSV"
  task customers: :environment do
    size = CSV.read("./db/data/customers.csv").length
    number_complete = 0.0
    CSV.foreach("./db/data/customers.csv",headers: true) do |row|
      Customer.create!(row.to_h)
      number_complete += 1
      percentage = (number_complete/size) * 100
      print("\r     #{percentage.to_i}% of Customers Imported")
    end
    print("\r     100% of Customers Imported\n")
  end

  desc "Import invoice items from CSV"
  task invoice_items: :environment do
    size = CSV.read("./db/data/invoice_items.csv").length
    number_complete = 0.0
    CSV.foreach("./db/data/invoice_items.csv",headers: true) do |row|
      row["unit_price"] = row["unit_price"].to_f / 100
      InvoiceItem.create!(row.to_h)
      number_complete += 1
      percentage = (number_complete/size) * 100
      print("\r     #{percentage.to_i}% of Invoice Items Imported")
    end
    print("\r     100% of Invoice Items Imported\n")
  end

  desc "Import invoices from CSV"
  task invoices: :environment do
    size = CSV.read("./db/data/invoices.csv").length
    number_complete = 0.0
    CSV.foreach("./db/data/invoices.csv",headers: true) do |row|
      Invoice.create!(row.to_h)
      number_complete += 1
      percentage = (number_complete/size) * 100
      print("\r     #{percentage.to_i}% of Invoices Imported")
    end
    print("\r     100% of Invoices Imported\n")
  end

  desc "Import items from CSV"
  task items: :environment do
    size = CSV.read("./db/data/items.csv").length
    number_complete = 0.0
    CSV.foreach("./db/data/items.csv",headers: true) do |row|
      row["unit_price"] = row["unit_price"].to_f / 100
      Item.create!(row.to_h)
      number_complete += 1
      percentage = (number_complete/size) * 100
      print("\r     #{percentage.to_i}% of Items Imported")
    end
    print("\r     100% of Items Imported\n")
  end

  desc "Import merchants from CSV"
  task merchants: :environment do
    size = CSV.read("./db/data/merchants.csv").length
    number_complete = 0.0
    CSV.foreach("./db/data/merchants.csv",headers: true) do |row|
      Merchant.create!(row.to_h)
      number_complete += 1
      percentage = (number_complete/size) * 100
      print("\r     #{percentage.to_i}% of Merchants Imported")
    end
    print("\r     100% of Merchants Imported\n")
  end

  desc "Import transactions from CSV"
  task transactions: :environment do
    size = CSV.read("./db/data/transactions.csv").length
    number_complete = 0.0
    CSV.foreach("./db/data/transactions.csv",headers: true) do |row|
      Transaction.create!(row.to_h)
      number_complete += 1
      percentage = (number_complete/size) * 100
      print("\r     #{percentage.to_i}% of Transactions Imported")
    end
    print("\r     100% of Transactions Imported\n")
  end
end

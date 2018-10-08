# README

Rales Engine. For when you want someone elses sales data to do things with!

## Getting the application set up on your machine

* Clone the Github respository - `git clone git@github.com:bghalami/rales_engine.git`

* Ruby version - `2.4.1p111`

* System dependencies - `bundle`

* Database creation - `rails db:create`

* Database initialization - `rails db:migrate`

* Database seeding - `rake import:data`

* How to run the test suite - `rspec`

- You're going to want to clone this bad boy boy down, run 'bundle' in the terminal, then visit the following filepaths to your hearts content. 
- Don't forget to get your server going with 'rails s'

## The available endpoints include:

### Record Endpoints

#### Merchants
* `/api/v1/merchants.json` returns all merchants
* `/api/v1/merchants/1.json` returns merchant 1

#### Invoices
* `/api/v1/invoices.json` returns all invoices
* `/api/v1/invoices/1.json` returns invoice 1

#### Invoice Items
* `/api/v1/invoice_items.json` returns all invoice_items
* `/api/v1/invoice_items/1.json` returns invoice_item 1

#### Items
* `/api/v1/items.json` returns all items
* `/api/v1/items/1.json` returns item 1

#### Transactions
* `/api/v1/transactions.json` returns all transactions
* `/api/v1/transactions/1.json` returns transaction 1

#### Customers
* `/api/v1/customers.json` returns all customers
* `/api/v1/customers/1.json` returns customer 1


### Relationship Endpoints

#### Merchants
* `/api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `/api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders
* `/api/v1/invoices/:id/transactions` returns a collection of associated transactions

#### Invoices
* `/api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `/api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `/api/v1/invoices/:id/items` returns a collection of associated items
* `/api/v1/invoices/:id/customer` returns the associated customer
* `/api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items
* `/api/v1/invoice_items/:id/invoice` returns the associated invoice
* `/api/v1/invoice_items/:id/item` returns the associated item

#### Items
* `/api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `/api/v1/items/:id/merchant` returns the associated merchant

#### Transactions
* `/api/v1/transactions/:id/invoice` returns the associated invoice

#### Customers
* `/api/v1/customers/:id/invoices` returns a collection of associated invoices

### Business Intelligence Endpoints

#### All Merchants

* `/api/v1/merchants/most_revenue?quantity=x` returns the top x merchants ranked by total revenue
* `/api/v1/merchants/most_items?quantity=x` returns the top x merchants ranked by total number of items sold
* `/api/v1/merchants/revenue?date=x` returns the total revenue for date x across all merchants

#### Single Merchant

* `/api/v1/merchants/:id/revenue` returns the total revenue for that merchant across successful transactions
* `/api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date x
* `/api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
* `/api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices. 

#### Items

* `/api/v1/items/most_revenue?quantity=x` returns the top x items ranked by total revenue generated
* `/api/v1/items/most_items?quantity=x` returns the top x item instances ranked by total number sold
* `/api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

#### Customers

* `/api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions

#### Random
* You can also select a random entry for any of the previously mentioned tables. 
* For example `/api/v1/merchants/random.json` will return a random merchant.

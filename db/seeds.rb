require 'csv'

CSV.foreach("db/seed_csvs/markets.csv", headers: [:id, :name, :address, :county, :city, :state, :postal_code]) do |row|
  row_hash = row.to_h
  row_hash.delete :id
  Market.create(row_hash)
end

CSV.foreach("db/seed_csvs/vendors.csv", headers: [:id, :name, :employees, :market_id]) do |row|
  row_hash = row.to_h
  row_hash.delete :id
  Vendor.create(row_hash)
end

CSV.foreach("db/seed_csvs/products.csv", headers: [:id, :name, :vendor_id]) do |row|
  row_hash = row.to_h
  row_hash.delete :id
  Product.create(row_hash)
end

CSV.foreach("db/seed_csvs/sales.csv", headers: [:id, :amount, :purchased_at, :vendor_id, :product_id]) do |row|
  row_hash = row.to_h
  row_hash.delete :id
  Sale.create(row_hash)
end

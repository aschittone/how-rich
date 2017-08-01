CSV.foreach("db/companylist.csv", headers: true) do |row|
   Stock.create(name: row[1], ticker_symbol: row[0])
end

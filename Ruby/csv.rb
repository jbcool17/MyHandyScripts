require 'csv'

data = CSV.read("sample.csv",  { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hashed_data = data.map { |d| d.to_hash }

hashed_data.each do |r|

	puts r
	puts "----------------------------------"

end


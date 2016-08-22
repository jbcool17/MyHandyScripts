require 'geoip'
require 'csv'

# ------------
# Handling Data
# CSV Columns: ip,pages,hits,bandwith,lastvisit
# ------------
data = CSV.read('ips.csv', { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hashed_data = data.map { |d| d.to_hash }

hashed_data.each do |r|
  r[:country] = GeoIP.new('GeoIp.dat').country(r[:ip]).country_name
end

# ------------
# Analyze Data
# ------------
results = Hash.new

hashed_data.each do |r|
  if (!results[r[:country]].nil?)
    results[r[:country]] += 1
  else
    results[r[:country]] = 1
  end
end

# Sort Alphabet
puts results.sort{|a,b| a[0]<=>b[0]}

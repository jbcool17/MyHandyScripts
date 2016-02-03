#Script by JB
#============
# ruby getAllBrewOptions.rb {program}
#============
require 'colorize'

puts "Message==>Starting...".green
puts " "

#Settings Up Variables

program = ARGV[0]
text_file_name = "temp_text.txt"
options_array = []

#Running command to get options
print "Message==> Getting options...".green
puts " "
system "brew info #{program} | grep '^--with-' >> #{text_file_name}"


#open file
file = File.new("#{text_file_name}", "r")

while (line = file.gets)

    options_array<< line.gsub(/\n/,"")
end

#closing file
file.close

#removes specific options
#options_array.slice!(0, 2)

options = options_array.join(' ')

puts "++=> Intallings with options:".red
puts "++=> #{options}".blue
puts " "

#running install command with options
system "brew install #{program} #{options}"

puts "++=> Installation done...removing temp text file"
system "rm #{text_file_name}"

puts "++=> DONE <=++".yellow

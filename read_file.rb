`brew info ffmpeg | grep "^--with-" >> test1.txt`

command_array = []

file = File.new("test1.txt", "r")

while (line = file.gets)

    command_array<< line.gsub(/\n/,"")
end

options = command_array.join(' ')


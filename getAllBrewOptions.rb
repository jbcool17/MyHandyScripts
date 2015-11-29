#Running command to get options

`brew info ffmpeg | grep "^--with-" >> test1.txt`

command_array = []

#open file
file = File.new("test1.txt", "r")

while (line = file.gets)

    command_array<< line.gsub(/\n/,"")
end

#closing file
file.close


options = command_array.join(' ')

#running install command with options
`brew install ffmpeg #{options}`

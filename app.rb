require 'socket'

server = TCPServer.new(2345)

count = 0
loop do
  Thread.start(server.accept) do |client|
   count += 1
   puts "\nClient connected!"
   puts "Client count: #{count}"

   while true
     client.puts "What do you say?"

    they_said = client.gets.chomp
    client.puts "You said: #{they_said}. Goodbye!"

    break if they_said == 'quit'
   end
   client.close
   puts "\nClient disconnected!"
   count -= 1
   puts "Client count: #{count}"
  end
end


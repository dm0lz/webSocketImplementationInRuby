require 'em-websocket'
require 'pry'


EventMachine.run {

    EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
        ws.onopen {
          puts "WebSocket connection open"

          # publish message to the client
          ws.send "Hello Client"
        }

        ws.onclose { puts "Connection closed" }


        ws.onmessage { |msg|
          puts "Received message: #{msg}"
          ws.send "Pong: #{msg}"
        }


    end
}
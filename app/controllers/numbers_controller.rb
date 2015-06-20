class NumbersController < ApplicationController
    puts "here"

    def refresh
        puts "in refresh"
        client = Faye::Client.new('http://localhost:3000/faye')
        puts Time.now
        loop do
            client.publish("/nupdate", {
                'number' => 5
            })
            sleep 5
        end
    end

    def number
    end


    # channel 'refresh' do
    #     monitor :subscribe do
    #         puts "Client #{client_id} subscribed to #{channel}."
    #     end
    #     monitor :unsubscribe do
    #         puts "Client #{client_id} unsubscribed from #{channel}."
    #     end
    #     monitor :publish do
    #         puts "Client #{client_id} published #{data.inspect} to #{channel}."
    #     end
    # end
end

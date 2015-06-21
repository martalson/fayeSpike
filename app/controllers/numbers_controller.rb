class NumbersController < ApplicationController
    puts "here"

    def refresh
        puts "in refresh"
        client = Faye::Client.new('https://sheltered-plateau-4876.herokuapp.com/faye')
        EM.defer do
            puts Time.now
            client.publish("/nupdate", {
                    'number' => 5
                })
            sleep 75
            client.publish("/nupdate", {
                'number' => 5
            })
            puts Time.now
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

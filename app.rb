require 'sinatra'
require 'twilio-ruby'

class PostToTwilioApp < Sinatra::Base
  post '/osmote' do
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH'])
    client.account.messages.create(
      to: params['phone_number'],
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: 'Success! Welcome to Code Osmosis Level 2!'
    )
    client.account.messages.create(
      to: ENV['ADMIN_PHONE_NUMBER'],
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: "Osmosis level up from #{params['phone_number']}!"
    )
  end
end

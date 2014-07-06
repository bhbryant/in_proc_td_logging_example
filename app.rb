require 'rubygems'
require 'bundler'
Bundler.require


require 'td'
require './socket_logger'

TreasureData::Logger.open_socket("td.#{ENV["TD_DATABASE"]}", path: ENV["TD_SOCKET"])


get '/log' do
  TD.event.post('event', params)
  200
end




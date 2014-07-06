require 'rubygems'
require 'bundler'
Bundler.require


require 'td'

port =  ENV['ROOT_PORT'].to_i > 24224 ?  ENV['ROOT_PORT'].to_i - 1 :  ENV['ROOT_PORT'].to_i + 1

TreasureData::Logger.open_agent("td.#{ENV["TD_DATABASE"]}", :host=>'localhost', :port=> port)
#TreasureData::Logger.open_agent("debug.#{ENV["TD_DATABASE"]}", :host=>'localhost', :port=>port)

get '/log' do
  TD.event.post('event', params)
  "#{port}\n"

end




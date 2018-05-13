require 'sinatra/base'
require_relative './lib/peep.rb'
# require 'rubygems'
# require 'data_mapper'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/add-a-new-peep' do
    erb :add_a_new_peep
  end

  post '/create-a-peep' do
    Peep.create(message: params['message'])
    redirect('/')
  end

  run! if app_file == $0

end

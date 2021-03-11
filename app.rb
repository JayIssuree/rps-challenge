require 'sinatra'
require './lib/game'

class RockPaperScissors < Sinatra::Base

    get '/' do
        erb(:index)
    end

    post '/names' do
        Game.create(player1: params[:player1], player2: params[:player2])
        redirect '/play'
    end

    get '/play' do
        @game = Game.current_game
        erb(:play)
    end


    run! if app_file == $0

end
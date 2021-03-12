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

    post '/play' do
        game = Game.current_game
        game.current_player.choose(game.get_choice(params["choice"]))
        game.switch_turns
        redirect '/finished' if game.complete?
        redirect '/play'
    end

    get '/finished' do
        @game = Game.current_game
        erb(:finished)
    end

    post '/reset' do
        Game.current_game.next_round
        redirect '/play'
    end


    run! if app_file == $0

end
class GamesController < ApplicationController
  # Add your GamesController code here
def index
  @games = Game.all
  render :json => @games
end

def new
  @game = Game.new
end

def create
  @game = Game.create(:state => params[:state])
  @game.save
  render :json => @game, status: 201
end

def show
  @game = Game.find(params[:id])
  render json: @game
end

def update
  @game = Game.find(params[:id])
  @game.update(:state => params[:state])
    render :json => @game, status: 202
end
end

private

def games_params
   params.require(:game).permit(:state)
 end

class PlayerController < ApplicationController
  def index
  end

  def show
    @players = Player.find_by(name: params[:id])
  end
end

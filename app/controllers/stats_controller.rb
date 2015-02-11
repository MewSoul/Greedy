class StatsController < ApplicationController
  def index

  end

  def show
    @players = Player.where("game = ?", params[:id]).order("name ASC").page(params[:page]).per(20)
  end
end

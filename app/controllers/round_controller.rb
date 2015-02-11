class RoundController < ApplicationController
  def add_round
    @tournament = Tournament.find(params[:tournament])

    if !@tournament
      abort("No tournament")
    end

    @player = Player.find_by(name: params[:team])
    match = params[:match].to_i
    player = params[:id].to_i % 2
      
    @round= Round.find_by(match: match);
    if @round && @player
      if player == 0
        @round.update(:score_1 => params[:score], :id_player_1 => @player.id)
      else
        @round.update(:score_2 => params[:score], :id_player_2 => @player.id)
      end
    else
      @round = Round.new
      @round.tournament_id = @tournament.id
      @round.id_player_1 = 0
      @round.id_player_2 = 0
      @round.score_1 = 0
      @round.score_2 = 0
      @round.bet_id_1 = 0
      @round.bet_id_2 = 0
      @round.match = match

      @round.highlighted = 0
      if player == 0
        @round.score_1 =  params[:score]
        @round.id_player_1 =  @player.id
      else
        @round.score_2 =  params[:score]
        @round.id_player_2 =  @player.id
      end
    end
    @round.save
  end

  def bracket
    @tournament = Tournament.find(params[:tournament])
    @round = @tournament.rounds.order("match ASC")
    render :layout => false
  end
end

class TournamentController < ApplicationController

  load_and_authorize_resource

  def index
    @tournament = Tournament.find(params[:id])
    @round = @tournament.rounds.order("match ASC")
  end

  def show
    @tournament = Tournament.find(params[:id])
    @round = @tournament.rounds.order("match ASC")
  end


  def distribute
    @tournament = Tournament.find(params[:id])
    @rounds = @tournament.rounds.order("id ASC")
  end

  def distri_bet
    round = Round.find(params[:id_match])
    if round.can_bet == false && round.bet_distributed == false
      if round.score_1.to_f > round.score_2.to_f
        winner = round.id_player_1
      else
        winner = round.id_player_2
      end
      bets = Mise.where("match_id = ?", params[:id_match])
      total_winner = 0
      total_looser = 0
      bets.each do |bet|
        if bet.player_id == winner
          total_winner = total_winner + bet.amount.to_f
        else
          total_looser = total_looser + bet.amount.to_f
        end
      end
      bets.each do |bet|
          if bet.player_id != winner
            bet.victory = false
            bet.gain = 0
            bet.save
          elsif bet.player_id == winner
            bet.victory = true
            percent = bet.amount.to_f * 100 / total_winner.to_f
            bet.gain = percent.to_f * total_looser.to_f / 100
            bet.save
            user = User.find(bet.user_id)
            user.credits = user.credits + bet.gain + bet.amount
            user.earnings = user.earnings + bet.gain
            user.save
          end
      end
      round.bet_distributed = true
      round.save
    end
    render :js => "window.location = ' #{request.referrer} ' "
  end
end

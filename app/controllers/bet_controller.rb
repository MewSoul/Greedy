class BetController < ApplicationController
  def index

  end


  def show
    @tournaments = Tournament.where("game = ?", params[:id])
    @match_one = Round.where("highlighted = ?", "1")
    @match_two = Round.where("highlighted = ?", "2")

    # respond_to do |format|
    #   format.html # some.html.erb
    #   format.json  { render :json => {:tournaments => @tournaments, :match_one => @match_one, :match_two => @match_two}.to_json  }
    # end
  end

  def player
    @tournaments = Tournament.where("game = ?", params[:tournament])
    @match_one = Round.where("match = ?", params[:match])
    render :layout => false
  end

  def greedy
    if user_signed_in?
      if params[:nb_cr].to_f <= current_user.credits and params[:player].to_f > 0 and params[:player].to_f < 3
        @round = Round.find_by(id: params[:round_id])
        if @round.can_bet == true
          if params[:player] == "1"
            @round.bet_id_1 = @round.bet_id_1 + params[:nb_cr].to_f
          elsif params[:player] == "2"
            @round.bet_id_2 = @round.bet_id_2 + params[:nb_cr].to_f
          end
          @round.save
          current_user.credits = current_user.credits - params[:nb_cr].to_f
          current_user.save
          mise = Mise.new(:amount => params[:nb_cr], :match_id => @round.id, :user_id => current_user.id)
          if params[:player] == "1"
            mise.player_id = @round.id_player_1
          elsif params[:player] == "2"
            mise.player_id = @round.id_player_2
          end
          mise.save
          flash[:ok] = "Bet successfull"
          if params[:popup].to_i > 0
            render :js => "window.location = '/tournament/#{params[:popup]}'"
          else
            render :js => "window.location = '#{request.path}' "
          end
        else
          flash[:ko] = "You can't bet anymore on this match"
          if params[:popup].to_i > 0
            render :js => "window.location = '/tournament/#{params[:popup]}'"
          else
            render :js => "window.location = ' #{request.path} ' "
          end
        end
      elsif params[:nb_cr].to_f > current_user.credits
        flash[:ko] = "You don't have enough credits"
        if params[:popup].to_i > 0
          render :js => "window.location = '/tournament/#{params[:popup]}'"
        else
          render :js => "window.location = ' #{request.path} ' "
        end
      elsif not params[:player]
        flash[:ko] = "No player selected"
        if params[:popup].to_i > 0
          render :js => "window.location = '/tournament/#{params[:popup]}'"
        else
          render :js => "window.location = ' #{request.path} ' "
        end
      end

    elsif
      render :js => "window.location = '/users/sign_in' "

    end

  end

end

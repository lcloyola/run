class PerformancesController < ApplicationController

  def index
    @athletes = current_user.my_athletes
    respond_to do |format|
      format.html
    end
  end
  def athlete_sessions
    @athlete = User.find(params[:id])
    @sessions = Tsession.where('user_id = ? AND is_done = ?', @athlete.id, true)
    respond_to do |format|
      format.html
    end
  end
end

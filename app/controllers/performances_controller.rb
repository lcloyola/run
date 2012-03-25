class PerformancesController < ApplicationController

  def index
    @title = "Performance"
    @athletes = current_user.my_athletes
    respond_to do |format|
      format.html
    end
  end
  def athlete_sessions
    @title = "Performance"
    @athlete = User.find(params[:id])
    @templates = Template.all
    @sessions = Tsession.where('user_id = ? AND is_done = ?', @athlete.id, true)
    respond_to do |format|
      format.html
    end
  end
end

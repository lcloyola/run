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
  def team_templates
    @title = 'Performance'
    @team = Team.find(params[:id])
    @athletes = User.where('coach_id = ?', current_user.id)
    @templates = Template.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end
end

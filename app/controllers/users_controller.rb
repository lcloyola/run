class UsersController < ApplicationController
  def create_athlete
    @title = 'Athlete'
    @athlete = User.new
    if user_signed_in? && current_user.coach
      respond_to do |format|
        format.html
        format.json { render json: @athlete }
      end
    end
  end
  def create_team
    @title = 'Athlete'
    @athlete = User.new
    if user_signed_in? && current_user.coach
      respond_to do |format|
        format.html
      end
    end
  end
  def edit_team
    @title = 'Athlete'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def view_template
    @title = 'Template'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def edit_template
    @title = 'Template'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def create_template
    @title = 'Template'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def create_session
    @title = 'Session'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def performance_indiv
    @title = 'Performance'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def performance_team
    @title = 'Performance'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def performance_logs
    @title = 'Performance'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def pending
    @title = 'Pending'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end  
  def fillout
    @title = 'Pending'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end  
  def athlete_logs
    @title = 'Performance'
  end
  def athlete_overall
    @title = 'Performance'
  end
  def athlete_session
    @title = 'Performance'
  end


end

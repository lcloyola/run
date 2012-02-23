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
end

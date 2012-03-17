class UsersController < ApplicationController
  def about_us
    @title = 'About Us'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def help
    @title = 'Help'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def prof_kei
    @title = 'Kei Cola'
    @athlete = User.new
		
		require 'google_chart'

	  lc = GoogleChart::LineChart.new("400x200", "My Results", false)
	  lc.data "Line green", [3,5,1,9,0,2], '00ff00'
	  lc.data "Line red", [2,4,0,6,9,3], 'ff0000'
	  lc.axis :y, :range => [0,10], :font_size => 10, :alignment => :center
	  lc.show_legend = false
	  lc.shape_marker :circle, :color => '0000ff', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10
		@z = lc
    respond_to do |format|
      format.html
    end
  end
  def prof_liz
    @title = 'Liz Loyola'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def prof_riza
    @title = 'Riza Pineda'
    @athlete = User.new
    respond_to do |format|
      format.html
    end
  end
  def prof_ru
    @title = 'Ru Santos'
    @athlete = User.new
    respond_to do |format|
      format.html
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

  def edit_profile
    @title = 'Profile'
  end

end

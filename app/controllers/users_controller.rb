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

	  lc = GoogleChart::LineChart.new("400x200", "Line Chart", false)
	  lc.data "Line yellow", [3,5,1,9,0,2], 'ffcc00'
	  lc.data "Line blue", [2,4,0,6,9,3], '11cccc'
	  lc.axis :y, :range => [0,10], :font_size => 10, :alignment => :center
	  lc.show_legend = false
	  lc.shape_marker :circle, :color => '362f2d', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10
		@z = lc
    respond_to do |format|
      format.html
    end
  end
  def prof_liz
    @title = 'Liz Loyola'
    @athlete = User.new

    require 'google_chart'

    bar_1_data = [350,110,700]
    bar_2_data = [200,800,50]
    color_1 = 'c53711'
    color_2 = '0000ff'
    names_array = ["Bob","Stella","Foo"]
    bc = GoogleChart::BarChart.new("600x300", "Horizontal Bar Graph", :horizontal, false) #do |bc|
      bc.data "FirstResultBar", bar_1_data, color_1
      bc.data "SecondResultBar", bar_2_data, color_2
      bc.axis :y, :labels => names_array, :font_size => 10
      bc.axis :x, :range => [0,1000]
      bc.show_legend = false
      bc.stacked = true
      bc.data_encoding = :extended
      bc.shape_marker :circle, :color => '00ff00', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10

      #puts bc.to_url
      @l = bc
    respond_to do |format|
      format.html
    end
  end
  def prof_riza
    @title = 'Riza Pineda'
    @athlete = User.new

    require 'google_chart'

    bar_1_data = [350,110,700]
    bar_2_data = [200,800,50]
    color_1 = 'c53711'
    color_2 = '0000ff'
    names_array = ["Bob","Stella","Foo"]
    bc = GoogleChart::BarChart.new("300x600", "Vertical Bar Graph", :vertical, false) #do |bc|
      bc.data "FirstResultBar", bar_1_data, color_1
      bc.data "SecondResultBar", bar_2_data, color_2
      bc.axis :y, :labels => names_array, :font_size => 10
      bc.axis :x, :range => [0,1000]
      bc.show_legend = false
      bc.stacked = true
      bc.data_encoding = :extended
      bc.shape_marker :circle, :color => '00ff00', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10

      #puts bc.to_url
      @r = bc

    respond_to do |format|
      format.html
    end
  end
  def prof_ru
    @title = 'Ru Santos'
    @athlete = User.new

    pc = GoogleChart::PieChart.new('320x200', "Pie Chart",false) #do |pc| 
      pc.data "Apples", 40 
      pc.data "Banana", 20 
      pc.data "Peach", 30 
      pc.data "Orange", 60 
      puts "\nPie Chart" 
      #puts pc.to_url 
      # Pie Chart with no labels 
      pc.show_labels = false 
      puts "\nPie Chart (with no labels)" 
      @s = pc



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

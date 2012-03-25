class UsersController < ApplicationController
  def switch
    if current_user.as_coach
      current_user.as_coach = false
    else
      current_user.as_coach = true
    end
    current_user.save
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Successfully switched role.' }
    end
  end
  def profile
    @user = User.find(params[:id])
    @title = "Profile"
    respond_to do |format|
      format.html
    end    
  end
  def about_us
    @title = 'About Us'
    respond_to do |format|
      format.html
    end
  end
  def help
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def help
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def help
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def help
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpnew
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpcat
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpses
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpcrteam
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpsavepdf
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpenath
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpviewat
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def helpviewprof
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  
  def helpeditprof
    @title = 'Help'
    respond_to do |format|    
      format.html
    end
  end
  def help
    @title = 'Help'
    respond_to do |format|
      format.html
    end
  end
  def prof_kei
    @title = 'Kei Cola'
    @athlete = User.new
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

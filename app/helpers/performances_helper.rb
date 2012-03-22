module PerformancesHelper

  def line_graph_athlete(session_id = nil)
    @session = Tsession.find(session_id)
    require 'google_chart'
	  lc = GoogleChart::LineChart.new("470x250", "Line Chart", false)
    values = make_session_array(session_id)
    i = 0
    values.each do |set|
      color = "%06x" % (rand * 0xffffff)
      lc.data "Set#{i + 1}", set, color
      i = i + 1
    end
	  lc.axis :y, :range => [0,10], :font_size => 10, :alignment => :center
	  lc.axis :x, :range => [1,@session.template.reps], :font_size => 10, :alignment => :center
	  lc.show_legend = true
  	return lc
  end
  
  def make_session_array(session_id = nil)
    @session = Tsession.find(session_id)
    @L = Array.new()
    rep = 0
    set = 0

    @L[0] = Array.new()
    @session.log.each do |log|
      @L[set] << log.value
      rep = rep + 1
      if rep == @session.template.reps && set != (@session.template.sets - 1)
        set = set + 1
        @L[set] = Array.new()
        rep = 0
      end
    end
    return @L
  end
  def bar_chart
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
    bc.show_legend = true
    bc.stacked = true
    bc.data_encoding = :extended
    bc.shape_marker :circle, :color => '00ff00', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10
    return bc
  end
  
  def pie_chart_athlete(id=nil)
    require 'google_chart'
    pc = GoogleChart::PieChart.new('500x200', "Training Templates",true) #do |pc| 
    template = Template.all
    athlete = User.find(id)
    template.each do |t|
      pc.data t.name, athlete.session_per_template(t.id).count
    end
    #puts "\nPie Chart" 
    pc.show_labels = true
    return pc
  end
  
  def v_bar
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

    return bc
  end
end

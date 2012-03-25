module PerformancesHelper

  def line_graph_athlete(session_id = nil, values = nil)
    @session = Tsession.find(session_id)
    require 'google_chart'
	  lc = GoogleChart::LineChart.new("470x250", "Value vs Rep", false)
    i = 0
    values.each do |set|
      color = "%06x" % (rand * 0xffffff)
      lc.data "Set#{i + 1}", set, color
      i = i + 1
    end
	  lc.axis :y, :range => [0, max2d(@session.set_arr)], :font_size => 10, :alignment => :center
	  lc.axis :x, :labels => [*1..@session.template.reps], :font_size => 10, :alignment => :center
	  lc.show_legend = true
  	return lc
  end

  def v_bar_athlete(session_id = nil, values = nil)
    require 'google_chart'
    @session = Tsession.find(session_id)
    
    bc = GoogleChart::BarChart.new "300x300", "set per rep", :vertical, false
    names_array = [*1..@session.template.reps]
    i = 1
    values.each do |set|
      bc.data "Set #{i}", set, ("%06x" % (rand * 0xffffff))
      i = i +1
    end
    bc.axis :y, :labels => names_array, :font_size => 10
    bc.axis :x, :labels => [*0..@session.template.sets].map! { |word| "rep #{word}" }
    if i > 1
      bc.stacked = true
      bc.show_legend = true
    end
    bc.data_encoding = :extended

    return bc
  end
  
  def max2d(arr = nil)
    max = []
    arr.each do |a|
      max << a.max
    end
    return max.max.to_int
  end
  
  def h_bar_athlete(id=nil)
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
    pc.show_legend = true
    return pc
  end
  
  def line_graph_athlete_template(template_id = nil, values = nil)
    @t = Template.find(template_id)
    require 'google_chart'
	  lc = GoogleChart::LineChart.new("470x250", "Ave Value vs Rep for #{@t.name}", false)
    i = 0
    values.each do |set|
      color = "%06x" % (rand * 0xffffff)
      lc.data "Set#{i + 1}", set, color
      i = i + 1
    end
	  lc.axis :y, :range => [0, max2d(values)], :font_size => 10, :alignment => :center
	  lc.axis :x, :labels => [*1..@t.reps], :font_size => 10, :alignment => :center
	  lc.show_legend = true
  	return lc
  end
end

module PerformanceHelper

  def line_graph
    require 'google_chart'

	  lc = GoogleChart::LineChart.new("400x200", "Line Chart", false)
	  lc.data "Line yellow", [3,5,1,9,0,2], 'ffcc00'
	  lc.data "Line blue", [2,4,0,6,9,3], '11cccc'
	  lc.axis :y, :range => [0,10], :font_size => 10, :alignment => :center
	  lc.show_legend = true
	  lc.shape_marker :circle, :color => '362f2d', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10
  	return lc
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

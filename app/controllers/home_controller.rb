class HomeController < ApplicationController
  def index
    @selected_date = Date.today
    @beginning_of_month = @selected_date.beginning_of_month
    @end_of_month = @selected_date.end_of_month
    products = Product.where({:date => @beginning_of_month..@end_of_month})
    p_types, p_prices = [],[]
    products.group_by{|p|p.product_type_id}.each do |key, items|
      p_types << ProductType.find(key).name rescue "未知"
      p_prices << items.map(&:total_price).sum
    end
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(categories: p_types)
      f.series(name: "花费", yAxis: 0, data: p_prices)

      f.yAxis [
        {title: {text: "总花费", margin: 10} },
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: 10, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end

    total = products.map(&:total_price).sum
    products_pie_data = []
    products.group_by{|p|p.product_type_id}.each do |key, items|
      products_pie_data << [(ProductType.find(key).name rescue "未知"), (items.map(&:total_price).sum*100/total).round(2)]
    end

    @chart_pie = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [30, 50, 20, 30]} )
      series = {
               :type=> 'pie',
               :name=> '花费占比',
               :data=> products_pie_data
      }
      f.series(series)
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"20px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end

    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['2016-01', '2016-02', '2016-03', '2016-04', '2016-05']
      f.series(:type=> 'column',:name=> '水费',:data=> [113, 42, 120, 113, 84])
      f.series(:type=> 'column',:name=> '电费',:data=> [112, 43, 130, 117, 86])
      f.series(:type=> 'column', :name=> '燃气费',:data=> [114, 43, 110, 119, 80])
      f.series(:type=> 'spline',:name=> '平均', :data=> [113, 42.62, 117, 113, 86.33])
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: 10, layout: 'vertical')
    end

    @chart4 = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['2016-01', '2016-02', '2016-03', '2016-04', '2016-05']
      f.series(:type=> 'spline',:name=> '报修数量',:data=> [5, 10, 10, 4, 8])
      f.series(:type=> 'spline',:name=> '维修数量',:data=> [4, 8, 8, 4, 5])
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: 10, layout: 'vertical')
    end
  end
end

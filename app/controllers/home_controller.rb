class HomeController < ApplicationController
  def index
    @selected_date = Date.today
    products = Product.where({:date => @selected_date.beginning_of_month..@selected_date.end_of_month})
    p_types, p_prices = [],[]
    products.group_by{|p|p.product_type_id}.each do |key, items|
      p_types << ProductType.find(key).name
      p_prices << items.map(&:total_price).sum
    end
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(categories: p_types)
      f.series(name: "花费", yAxis: 0, data: p_prices)

      f.yAxis [
        {title: {text: "总花费", margin: 70} },
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end

    @chart_pie = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> [
                  ['Firefox',   45.0],
                  ['IE',       26.8],
                  {
                     :name=> 'Chrome',    
                     :y=> 12.8,
                     :sliced=> true,
                     :selected=> true
                  },
                  ['Safari',    8.5],
                  ['Opera',     6.2],
                  ['Others',   0.7]
               ]
      }
      f.series(series)
      f.options[:title][:text] = "THA PIE"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
  end
end

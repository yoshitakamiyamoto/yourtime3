class UsersController < ApplicationController
def show
  user_posts = Post.where(user_id: params[:id]).pluck(:used_time)
  available_time = GoogleCalendar.calendar
  time = available_time - user_posts.sum.to_i
  days = Post.where(user_id: params[:id]).pluck(:created_at)
  @user = User.find(params[:id])
  # @name = current_user.name
  # @activity = current_user.activity
  @other_users = User.where(activity_id: current_user.activity_id)
  @tweets = Post.where(user_id: params[:id]).order("created_at DESC").page(params[:page]).per(5)
    product_A_sales = [ user_posts.sum ]
    product_B_sales = [ time ]
    # product_A_sales = [ #全体の時間÷実際に使った時間×100 ]
    # product_B_sales = [ #100% ]
  @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "アクティビティに費やした実時間")
      c.pane(size:'100%')
      c.series({
        colorByPoint: true,
        # ここでは各月の売上額合計をグラフの値とする
        data: [{
          name: '実時間',
          y: product_A_sales.reduce{|sum,e| sum + e}
          }, {
          name: '使えていない時間',
          y: product_B_sales.reduce{|sum,e| sum + e}
          }]
      })
      c.plotOptions(pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '{point.name}: {point.percentage:.1f} %',
        }
      })
      # グラフの種類として「パイチャート」を指定
      c.chart(type: "pie" )
   end

   @chart2 = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "デイリー自己投資")
      # X軸の名称を設定 '日'
      c.xAxis(categories: days, title: {text: '日'})       # Y軸の名称を設定 '円'
      c.yAxis(title: {text: '自己投資時間'})
      product_A_sales = [ user_posts ]
      c.series(name: "自己投資時間", data: product_A_sales )
      # 判例を右側に配置
     c.legend(align: 'right', verticalAlign: 'top',
       x: -100, y: 180, layout: 'vertical')
     # グラフの種類を「折れ線グラフ」から「棒グラフ」に変更
     c.chart(type: "column")
    end
  end

  def update
    @user = User.find(params[:id])
  end

  def create
    user = User.find(current_user)
    user.update(name: params[:name])
    user.update(position: params[:position])
    user.update(goal: params[:goal])
    user.update(s_introducution: params[:s_introducution])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

end

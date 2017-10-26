Rails.application.routes.draw do

  devise_for :users
  root 'tweets#index'

get 'tweets' =>  'tweets#index'       #
get   'tweets/new'  =>  'tweets#new'       #ツイート投稿画面
get   'activity/select' => 'activities#select'
post   'activity/create' => 'activities#create'
post  'tweets'      =>  'tweets#create'    #ツイート投稿機能
delete  'tweets/:id'  => 'tweets#destroy'
get   'users/:id'   =>  'users#show'   #Mypage・他ユーザーpageへのルーティング
get   'tweets/:id/edit'  => 'tweets#edit'
patch   'tweets/:id'  => 'tweets#update'
get   'profile/update/:id'  =>  'users#update'
post  'profile/create/:id'  =>  'users#create'
get   'timeline'=> 'tweets#timeline_show'      #タイムライン表示画面

end

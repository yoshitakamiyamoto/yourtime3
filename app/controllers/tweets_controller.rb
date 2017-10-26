class TweetsController < ApplicationController

  def index
    @tweets = Post.order("created_at DESC").page(params[:page]).per(5)
    end

  def new
    end

  def create
     Post.create(activity_id: current_user.activity.id, available_time: params[:available_time], used_time: params[:used_time], comment: params[:comment], user_id: current_user.id)
    end

  def destroy
      tweet = Post.find(params[:id])
        tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweet = Post.find(params[:id])
  end

  def update
      tweet = Post.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.update(tweet_params)
      end
    end



end

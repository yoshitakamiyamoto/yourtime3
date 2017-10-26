class ActivitiesController < ApplicationController
  def select
  end
  def create
    user = User.find(current_user)
    user.update(activity_id: params[:activity_id].to_i)
    activity = Activity.find(params[:activity_id].to_i)
    activity.update(user_id: current_user.id)
  end

end

#名称を変更する

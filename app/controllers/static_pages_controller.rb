class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @project = current_user.projects.build
      @feed_items = current_user.feed_items.includes(:user).page(params[:page]).per(10).order(created_at: :desc)
    end
  end
end

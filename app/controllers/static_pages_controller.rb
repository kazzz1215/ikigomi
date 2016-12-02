class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @project = current_user.projects.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
end

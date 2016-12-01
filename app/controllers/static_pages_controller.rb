class StaticPagesController < ApplicationController
  def home
    @project = current_user.projects.build if logged_in?
  end
end

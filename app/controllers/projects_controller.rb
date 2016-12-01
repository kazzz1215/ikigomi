class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:create]

    def show
        @project = Project.find(params[:id]) 
        @user = @project.user
    end
    
    def create
       @project = current_user.projects.build(project_params)
       if @project.save
            flash[:success] = "Project created!"
            redirect_to root_url
       else
            render 'static_pages/home'
       end
    end
    
    def destroy
       @project = current_user.projects.find_by(id: params[:id])
       return redirect_to root_url if @project.nil?
       @project.destroy
       flash[:success] = "Project deleted"
       redirect_to request.referrer || root_url
    end
    
    private
    def project_params
        params.require(:project).permit(:title) 
    end
    
end

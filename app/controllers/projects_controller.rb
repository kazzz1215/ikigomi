class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    before_action :set_project, only: [:show, :edit, :update]
    before_action :check_project, only: [:edit, :update]

    def show
        @user = @project.user
    end
    
    def new
        @project = Project.new
    end
    
    def create
        @project = current_user.projects.build(project_params)
        if @project.save
            flash[:success] = "Project created!"
            redirect_to @project
        else
            render 'new'
        end
    end
    
    def edit
    end
  
    def update
        if @project.update(project_params)
            flash[:success] = 'プロジェクトを更新しました'
            redirect_to @project
        else
            render 'edit'
        end
    end
    
    def destroy
       @project = current_user.projects.find_by(id: params[:id])
       return redirect_to root_url if @project.nil?
       @project.destroy
       flash[:success] = "Project deleted"
       redirect_to @project.user
    end
    
    private
    def project_params
        params.require(:project).permit(:title, :content, :image, :done) 
    end
    
    def set_project
        @project = Project.find(params[:id]) 
    end
    
    def check_project
        @project = Project.find(params[:id]) 
        redirect_to root_path if @project.user != current_user
    end
    
end

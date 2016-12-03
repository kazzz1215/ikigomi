class TasksController < ApplicationController
    before_action :logged_in_user, only: [:create]
    before_action :set_task, only: [:show, :edit, :update, :destroy, :check_task]
    before_action :check_task, only: [:edit, :update]

    def show
        @user = @task.project.user
    end
    
    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.create(task_params)
        redirect_to request.referrer || root_url
    end
    
    def edit
    end
  
    def update
        @project = Project.find(params[:project_id])
        if @task.update(task_params)
            flash[:success] = 'タスクを更新しました'
            redirect_to @project
        else
            render 'edit'
        end
    end
    
    def destroy
        @project = Project.find(params[:project_id])
        @task.destroy
        redirect_to @project
    end
    
    private
    def task_params
        params.require(:task).permit(:title, :content, :image, :done) 
    end
    
    def set_task
        @task = Task.find(params[:id]) 
    end
    
    def check_task
        redirect_to root_path if @task.project.user != current_user
    end

end

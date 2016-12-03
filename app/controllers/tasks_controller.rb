class TasksController < ApplicationController
    
    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.create(task_params)
        redirect_to request.referrer || root_url
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to request.referrer || root_url
    end
    
    private
    
    def task_params
       params[:task].permit(:title) 
    end
end

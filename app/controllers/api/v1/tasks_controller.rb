module Api
  module V1
    class TasksController < Api::V1::ApplicationController

    def index
        render json: decorated_tasks, each_serializer: TasksSerializer 
    end        

    
    def show
        render json: task, serializer: TaskSerializer,comments_count: task.comments_count
    end

    def destroy
        @task = @current_user.tasks.find_by(params[:id])
        if @task
            @task.destroy
        else
          render json: {post: "not found"}, status: :not_found
        end
    end

    def create
        task= Task.new(task_params)
        task.user = @current_user

        task.save

        render json: task
    end

    
    private
        def task_params
          params.require(:task).permit(:text, :status, :project_id)
        end

        def decorated_tasks
            tasks= @current_user.tasks
            tasks.map {|task| TaskDecorator.new(task) }
        end

        def task
            TaskDecorator.new(Task.find(params[:id]))
        end
    end
  end
end
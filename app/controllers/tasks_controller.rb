class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.save

    respond_to do |format|
      format.html { redirect_to  tasks_path }
      format.js
    end
  end

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html {redirect_to  tasks_path}
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to  tasks_path }      
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:text, :status, :user_id, :project_id)
    end
end

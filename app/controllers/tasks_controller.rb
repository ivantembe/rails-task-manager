class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # raise
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # to display the form to create the restaurant
    @task = Task.new
  end

  def create
    # actual creation of the restaurant
    task = Task.create(task_params)
    redirect_to task_path(task)
  end

  def edit
    # to display the form to edit the restaurant
    @task = Task.find(params[:id])
  end

  def update
    # actual update of the restaurant
    task = Task.find(params[:id])
    task.update(task_params)

    redirect_to task_path(task)
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

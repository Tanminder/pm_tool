class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to tasks_path, notice: "Task created succesfully!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update_attributes task_params
      redirect_to tasks_path, notice: "Task updated succesfully!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Task deleted succesfully!"
  end

  private

  def task_params
    params.required(:task).permit(:title, :due_date)
  end

  def find_task
    @task = Task.find params[:id]
  end

end

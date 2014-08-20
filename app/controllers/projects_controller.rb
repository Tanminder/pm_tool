class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save 
      redirect_to projects_path, notice: "Project created successfully!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes project_params
      redirect_to project_path, notice: "Project updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project deleted successfully!"
  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

end

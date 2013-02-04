class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def create
    project = Project.create(params[:project])
    redirect_to project_path(project)
  end
end

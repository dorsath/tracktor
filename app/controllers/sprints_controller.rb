class SprintsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    if project
      params[:sprint][:active] = true
      sprint = project.sprints.create(params[:sprint])
    end

    render text: (project && sprint) ? sprint.id : false
  end

  def show
    @sprint = Sprint.find(params[:id])
    render layout: false
  end
end

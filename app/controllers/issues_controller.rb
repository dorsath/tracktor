class IssuesController < ApplicationController
  def continue
    issue = Issue.find(params[:id])
    if issue
      issue.start_by(current_user)
    end

    redirect_to :back
  end

  def stop
    issue = Issue.find(params[:id])
    if issue
      session = current_user.current_session
      session.stop if session
    end

    redirect_to :back
  end

  def move
    issue = Issue.find(params[:id])
    sprint = Sprint.find(params[:sprint_id])
    if issue && sprint
      issue.update_attribute(:sprint, sprint)
    end

    render text: (issue && sprint)
  end

  def update
    issue = Issue.find(params[:id])
    if issue
      success = issue.update_attributes(params[:issue])
    end

    render text: success ? success : false
  end


  def create
    project = Project.find(params[:project_id])
    if project
      params[:issue][:created_by] = current_user
      issue = project.backlog.issues.create(params[:issue])
    end

    render text: (project && issue) ? issue.id : false
  end

  def show
    @issue = Issue.find(params[:id])

    render layout: false
  end

  def start
    issue = Issue.find(params[:id])
    if issue
      issue.status = :in_progress
      issue.start_by(current_user)
    end

    redirect_to :back
  end

  def complete
    issue = Issue.find(params[:id])
    if issue
      issue.status = :feedback
      current_user.current_session.stop if current_user.current_issue == issue
    end

    redirect_to :back
  end

  def reject
    issue = Issue.find(params[:id])
    if issue
      issue.status = :rejected
    end

    redirect_to :back
  end

  def accept
    issue = Issue.find(params[:id])
    if issue
      issue.status = :accepted
    end

    redirect_to :back
  end

  def reopen
    issue = Issue.find(params[:id])
    if issue
      issue.status = :in_progress
      issue.start_by(current_user)
    end

    redirect_to :back
  end

end

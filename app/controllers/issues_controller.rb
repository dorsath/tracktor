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
end
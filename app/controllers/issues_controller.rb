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
      session = User.current_session
      session.stop if session
    end

    redirect_to :back
  end
end

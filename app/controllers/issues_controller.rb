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
    product = Product.find(params[:product_id])
    if product
      issue = product.backlog.issues.create(params[:issue])
    end

    render text: (product && issue) ? issue.id : false
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

end

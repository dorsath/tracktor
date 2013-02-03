class SprintsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    if product
      params[:sprint][:active] = true
      sprint = product.sprints.create(params[:sprint])
    end

    render text: (product && sprint) ? sprint.id : false
  end

  def show
    @sprint = Sprint.find(params[:id])
    render layout: false
  end
end

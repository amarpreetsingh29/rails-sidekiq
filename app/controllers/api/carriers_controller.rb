class Api::CarriersController < ApplicationController
  def index
    render json: Carrier.all, status: 200, content_type: "application/json"
  end

  def show
    render json: Carrier.find_by(name: params[:name]), status: 200, content_type: "application/json"
  end
end

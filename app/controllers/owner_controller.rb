class OwnerController < ApplicationController
  before_action :authenticate_user!

  def index
    unless current_user.role == "owner"
      redirect_to root_path
    end
  end

  def show
  end

  def create_company
  end
end

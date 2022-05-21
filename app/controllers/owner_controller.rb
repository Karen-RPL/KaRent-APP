class OwnerController < ApplicationController
  before_action :authenticate_user!

  # Controller untuk tampilan dashboard
  def index
    # Apabila user bukan owner maka akan di lempar ke root_path
    unless current_user.role == "owner"
      redirect_to root_path
    end
  end

  #Controller untuk menampilkan profile perusahaan
  def show
  end

  #Controller untuk membuat perusahaan
  def create_company
  end
end

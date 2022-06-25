class OwnerController < ApplicationController
  before_action :authenticate_user!

  # Controller untuk tampilan dashboard
  def index
    # Apabila user bukan owner maka akan di lempar ke root_path
    unless current_user.role == "owner"
      redirect_to root_path
    end
    @orders = Order.all
  end

  #Controller untuk menampilkan profile perusahaan
  def show
    @company = Company.find_by_user_id(current_user.id)
    render :show_company
  end

  #Controller untuk membuat perusahaan
  def new_company
    @company = Company.new
    render :create_company
  end

  def create_company
    # @company = Company.new(company_params)
    #
    # respond_to do |format|
    #   if @company.save
    #     format.html { redirect_to owner_index_path, notice: "Company was successfully created." }
    #   else
    #     format.html { render :create_company, status: :unprocessable_entity }
    #   end
    # end

    @company = Company.new(params.permit(:name, :time_open, :time_close, :address, :user_id))

    if @company.save
      redirect_to owner_index_path, notice: 'Company successfully added!'
    else
      render :create_company
    end
  end

  def update
    respond_to do |format|
      if @company.update(params.permit(:name, :time_open, :time_close, :address, :user_id))
        format.html { redirect_to cars_url, notice: "Car was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:create_company).permit(:name, :time_open, :time_close, :address, :user_id)
  end
end

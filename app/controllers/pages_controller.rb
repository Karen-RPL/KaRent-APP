class PagesController < ApplicationController
  before_action :set_car, only: %i[ detail ]
  def home
    @cars = Car.limit(3)
  end

  def about_us

  end

  def catalog
    @cars = Car.all
  end

  def detail

  end

  private
    def set_car
      @car = Car.find(params[:id])
    end
end

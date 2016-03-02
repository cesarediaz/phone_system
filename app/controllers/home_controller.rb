class HomeController < ApplicationController
  def index
  end

  def cities
    @cities = Country.find_by(code: params['country'] ||= 'AR').cities.order(:name).page(params[:page] ||= 1).per(5)
  end
end

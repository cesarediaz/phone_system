class CitiesController < ApplicationController
  def index
    @cities = Country.find_by(code: params['country'] ||= 'AR').cities.order(:name).page(params[:page] ||= 1).per(5)
  end

  def show
    @city = City.find(params['id'])
    @phones = @city.phones.limit(10)
  end
end

class City < ActiveRecord::Base
  belongs_to :country
  has_many :phones

  paginates_per 5
  max_paginates_per 100
end

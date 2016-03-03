class Phone < ActiveRecord::Base
  belongs_to :city

  def as_json(options={})
    super(only: [:number])
  end
end

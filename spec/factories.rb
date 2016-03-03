FactoryGirl.define do
  factory :country do
    code 'ar'
    name 'argentina'
  end

  factory :city do
    name 'Buenos Aires'
    country
  end

  factory :phone do
    number '29394029294'
    city
  end
end

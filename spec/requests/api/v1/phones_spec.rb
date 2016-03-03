require 'rails_helper'

describe 'Phones API' do
  before do
    @city = FactoryGirl.create(:city)
    10.times { FactoryGirl.create(:phone, number: "#{(rand() * 100000000).to_i}", city_id: @city.id) }
  end

  it 'get a list of phones' do
    get "/api/v1/phones/get_list?city_id=#{@city.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it 'return apropiate message when city_id does not exist' do
    get "/api/v1/phones/get_list?city_id=#{@city.id + 1}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['status']).to eq('failure')
    expect(json['error']).to eq('This city ID does not exist')
  end

  it 'return apropiate message when city_id is not valid' do
    get '/api/v1/phones/get_list?city_id=123a'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['status']).to eq('failure')
    expect(json['error']).to eq('Bad request. Please provide a valid city ID')
  end

  it 'return terms and conditions and positive message when is ordered an existent number' do
    get "/api/v1/phones/order_number?number=#{Phone.first.number}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['status']).to eq('success')
    expect(json['message']).to eq('phone number exist')
    expect(json['terms']).to eq('Lorem ipsum dolor sit amet, consectetur adipiscing
        elit, sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad ...')
  end

  it 'return failure status and negative message when is ordered an inexistent number' do
    get "/api/v1/phones/order_number?number=#{Phone.first.number}123"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['status']).to eq('failure')
    expect(json['message']).to eq('phone number does not exist')
    expect(json['terms']).to eq('')
  end
end

require 'rails_helper'

describe "API for user login", :type => :request do
  before {post '/api/users/login', params: {:username => 'username', :password => 'password'}}

  it 'response' do
    expect(JSON.parse(response.body)["error"]).to eq('1')
  end

  it 'return status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "API for create user", :type => :request do
  before {post '/api/users/create', params: {:username => 'username', :password => 'password'}}

  it 'response' do
    expect(JSON.parse(response.body)["error"]).to eq('1')
  end

  it 'return status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "API for get list of cats", :type => :request do
  before {get '/api/breeds'}

  it 'response' do
    expect(JSON.parse(response.body)["error"]).to eq('0')
  end

  it 'return status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "API for create cats", :type => :request do
  before {post '/api/breeds', params: {:name => 'name', :life_span => 'life_span', :origin => 'origin', :temperament => 'temperament', :image => 'image'}}

  it 'response' do
    expect(JSON.parse(response.body)["error"]).to eq('1')
  end

  it 'return status code 200' do
    expect(response).to have_http_status(:success)
  end
end
require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'John', email: 'john@mail.com', password: 'johntesting') }
  let(:food) { user.foods.create(name: 'carrot cake', measurement_unit: 'grams', price: 10) }

  describe 'GET /index' do
    before do
      sign_in user
      get user_foods_path(1)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
  describe 'GET /new' do
    before do
      sign_in user
      get new_user_food_path(1)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Recipe App')
    end
  end
end

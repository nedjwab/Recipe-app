require 'rails_helper'

RSpec.describe 'Food Page', type: :request do
  describe 'GET #index' do
    include Devise::Test::IntegrationHelpers
    before do
      @user = User.create(name: 'Huseyin', password: '123456', email: 'hb@gmail.com')
      @food = @user.foods.create(name: 'Chickpea', measurement_unit: 'kg', price: 5, quantity: 2)
      sign_in @user
    end
    it 'is a HTTP success' do
      get(foods_path)
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get(foods_path)
      expect(response).to render_template('index')
    end
    it 'renders the foods as list' do
      get(foods_path)
      expect(response.body).to include(@food.name)
    end
  end
end

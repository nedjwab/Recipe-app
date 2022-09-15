require 'rails_helper'

RSpec.describe 'Shopping List Page', type: :request do
  describe 'GET #index' do
    include Devise::Test::IntegrationHelpers
    before do
      @user = User.create(name: 'Huseyin', password: '123456', email: 'hb@gmail.com')
      sign_in @user
    end
    it 'is a HTTP success' do
      get(shopping_list_index_path)
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get(shopping_list_index_path)
      expect(response).to render_template('index')
    end
    it 'renders the text on the page' do
      get(shopping_list_index_path)
      expect(response.body).to include('Amount of food items')
    end
  end
end

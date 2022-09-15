require 'rails_helper'

RSpec.describe 'Recipes List Page', type: :request do
  describe 'GET #index' do
    include Devise::Test::IntegrationHelpers
    before do
      @user = User.create(name: 'Huseyin', password: '123456', email: 'hb@gmail.com')
      @recipe = @user.recipes.create(name: 'Hummus', preparation_time: '30', cooking_time: '30', description: 'go shopping first', public: 'true')
      sign_in @user
    end
    it 'is a HTTP success' do
      get(user_recipes_path(@user))
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get(user_recipes_path(@user))
      expect(response).to render_template('index')
    end
    it 'renders the recipes as list' do
      get(user_recipes_path(@user))
      expect(response.body).to include(@recipe.name)
    end
  end
end

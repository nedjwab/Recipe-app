require 'rails_helper'

RSpec.describe 'Recipes Public List Page', type: :request do
  describe 'GET #index' do
    include Devise::Test::IntegrationHelpers
    before do
      @user = User.create(name: 'Huseyin', password: '123456', email: 'hb@gmail.com')
      @recipe = @user.recipes.create(name: 'Hummus', preparation_time: '30', cooking_time: '30', description: 'go shopping first', public: 'true')
      sign_in @user
    end
    it 'is a HTTP success' do
      get(recipes_index_path)
      expect(response).to have_http_status(:ok)
    end
    it "renders 'public' template" do
      get(recipes_index_path)
      expect(response).to render_template('public')
    end
    it 'renders the recipe name' do
      get(recipes_index_path)
      expect(response.body).to include(@recipe.name)
    end
    it 'renders the recipe owner name' do
      get(recipes_index_path)
      expect(response.body).to include(@user.name)
    end
  end
end

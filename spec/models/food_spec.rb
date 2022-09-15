require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: 123_456, password_confirmation: 123_456)
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      food = Food.new(name: 'Apples', measurement_unit: 'pieces', price: 18, quantity: 24, user_id: @user.id)
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      food = Food.new(name: nil, measurement_unit: 'pieces', price: 18, quantity: 24, user_id: @user.id)
      expect(food).to_not be_valid
    end

    it 'is not valid without mesurement_unit' do
      food = Food.new(name: 'Apples', measurement_unit: nil, price: 18, quantity: 24, user_id: @user.id)
      expect(food).to_not be_valid
    end

    it 'is not valid without price' do
      food = Food.new(name: 'Apples', measurement_unit: 'pieces', price: nil, quantity: 24, user_id: @user.id)
      expect(food).to_not be_valid
    end

    it 'is not valid without quantity' do
      food = Food.new(name: 'Apples', measurement_unit: 'pieces', price: 18, quantity: nil, user_id: @user.id)
      expect(food).to_not be_valid
    end

    it 'is not valid without user id' do
      food = Food.new(name: 'Apples', measurement_unit: 'pieces', price: 18, quantity: 24, user_id: nil)
      expect(food).to_not be_valid
    end
  end

  context 'associations' do
    it 'has_many recipes' do
      t = Food.reflect_on_association(:recipe_foods)
      expect(t.macro).to eq :has_many
    end
    it 'belongs_to user' do
      t = Food.reflect_on_association(:user)
      expect(t.macro).to eq :belongs_to
    end
  end
end

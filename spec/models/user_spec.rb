# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(email: 'john@gmail', password: '123456', password_confirmation: '123456')
  end
  context 'valid User' do
    it 'has a valid email' do
      expect(@user).to be_valid
    end
    it 'has a valid name' do
      expect(@user).to be_valid
    end
  end

  context 'invalid User' do
    it 'has a invalid email' do
      @user.email = ' '
      expect(@user).to_not be_valid
    end
    it "password don't match" do
      @user.password = '123678'
      expect(@user).to_not be_valid
    end
    it 'has a unique email' do
      user = User.new(email: 'john@gmail', password: '123456', password_confirmation: '123456')
      user.invalid?
      expect(user.errors[:email]).to include('has already been taken')
    end
  end
end

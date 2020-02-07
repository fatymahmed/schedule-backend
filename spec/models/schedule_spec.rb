# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before :each do
    @talk = Talk.create(title: 'opening speech 2',
                        description: 'orem ipsum dolor sit amet, consectetur adipiscing,
elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat',
                        startTime: 'DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 2)',
                        endTime: 'DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 1',
                        location: 'hall 1', speakers: ['speaker 1'])
    @user = User.create(email: 'john@gmail', password: '123456', password_confirmation: '123456')
    @schedule = Schedule.new(talk: @talk, user: @user)
  end

  context 'valid Schedule' do
    it 'has a valid user' do
      expect(@schedule).to be_valid
    end
    it 'has a valid talk' do
      expect(@schedule).to be_valid
    end
  end

  context 'invalid Schedule' do
    it 'has a invalid user' do
      @schedule.user_id = nil
      expect(@schedule).to_not be_valid
    end
    it 'has a invalid talk' do
      @schedule.talk_id = nil
      expect(@schedule).to_not be_valid
    end
  end
end

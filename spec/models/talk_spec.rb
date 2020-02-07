# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Talk, type: :model do
  before :each do
    @talk = Talk.new(title: 'opening speech 2',
                     description: 'orem ipsum dolor sit amet, consectetur adipiscing,
elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat',
                     startTime: 'DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 2)',
                     endTime: 'DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 1',
                     location: 'hall 1', speakers: ['speaker 1'])
  end
  context 'valid Talk' do
    it 'has a valid title' do
      expect(@talk).to be_valid
    end
    it 'has a valid startTime' do
      expect(@talk).to be_valid
    end
    it 'has a valid location' do
      expect(@talk).to be_valid
    end
    it 'has a valid endTime' do
      expect(@talk).to be_valid
    end
  end

  context 'invalid Talk' do
    it 'has a invalid title' do
      @talk.title = ' '
      expect(@talk).to_not be_valid
    end
    it 'has a invalid location' do
      @talk.location = ' '
      expect(@talk).to_not be_valid
    end
    it 'has a invalid startTime' do
      @talk.startTime = ' '
      expect(@talk).to_not be_valid
    end
    it 'has a invalid endTime' do
      @talk.endTime = ' '
      expect(@talk).to_not be_valid
    end
    it 'has a unique email' do
      talk = Talk.new(title: 'opening speech 2',
                      startTime: 'DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 2)',
                      endTime: 'DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 1',
                      location: 'hall 1', speakers: ['speaker 1'])
      @talk.save
      expect(talk).to_not be_valid
    end
  end
end

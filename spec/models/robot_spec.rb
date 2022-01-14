require 'rails_helper'

RSpec.describe Robot, type: :model do

  before do
    @robot = Robot.new(x_location: 2, y_location: 2, f_direction: "north")
  end

  subject { @robot }

  it 'should create a new robot' do
    expect(subject).to be_valid
  end

  it 'validates x location presence' do
    subject.x_location = nil
    expect(subject).to_not be_valid
  end

  it 'validates y location presence' do
    subject.x_location = nil
    expect(subject).to_not be_valid
  end

  it 'validates f location presence' do
    subject.f_direction = nil
    expect(subject).to_not be_valid
  end

  context 'X location is out of table' do
    it 'should not validate position' do
      subject.x_location = 5
      expect(subject).to_not be_valid
    end
  end

  context 'Y location is out of table' do
    it 'should not validate position' do
      subject.y_location = 100
      expect(subject).to_not be_valid
    end
  end

  context 'F direction not included' do
    it 'should not validate position' do
      subject.f_direction = "southwest"
      expect(subject).to_not be_valid
    end
  end



end
require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject { build(:user_doctor) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with empty phone number" do
    subject.phone = ''
    expect(subject).to_not be_valid
  end

  it "is not valid when phone number has too many digits" do
    subject.phone += '8' 
    expect(subject).to_not be_valid
  end

  it "is not valid when phone number hawe a letters" do
    subject.phone[subject.phone.size/2] = 'A' 
    expect(subject).to_not be_valid
  end

  it "is not valid when phone number has no prefix" do
    subject.phone = subject.phone[3, subject.phone.size] 
    expect(subject).to_not be_valid
  end

  it "is not valid when character order is out of order" do
    subject.phone = subject.phone.reverse 
    expect(subject).to_not be_valid
  end

  it "is not valid when prefix contains invalid digits" do
    subject.phone[4] = '2' 
    expect(subject).to_not be_valid
  end
end

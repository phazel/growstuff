require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  before(:each) do
    @member = FactoryGirl.create(:member)
    @ability = Ability.new(@member)
  end

  it 'member can view their own notifications' do
    @notification = FactoryGirl.create(:notification, :recipient => @member)
    @ability.should be_able_to(:read, @notification)
  end

  it "member can't view someone else's notifications" do
    @notification = FactoryGirl.create(:notification,
      :recipient => FactoryGirl.create(:member)
    )
    @ability.should_not be_able_to(:read, @notification)
  end

  it 'member can make a payment' do
    @ability.should be_able_to(:create, Payment)
  end

  it 'member can read their own payments' do
    @payment = FactoryGirl.create(:payment, :payer => @member)
    @ability.should be_able_to(:read, @payment)
  end

  it "member can't read other people's payments" do
    @payment = FactoryGirl.create(:payment, :payer => FactoryGirl.create(:member))
    @ability.should_not be_able_to(:read, @payment)
  end
end

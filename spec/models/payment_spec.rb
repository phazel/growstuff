require 'spec_helper'

describe Payment do

  it "has a payer" do
    @payment = FactoryGirl.create(:payment)
    @payment.payer.should be_an_instance_of Member
  end

  context "amount" do
    it "must not be blank" do
      @payment = FactoryGirl.build(:payment, :amount => nil)
      @payment.save.should_not be_true
    end

    it "must be numeric" do
      @payment = FactoryGirl.build(:payment, :amount => "aaa")
      @payment.save.should_not be_true
    end

    it "must be greater than or equal to 10" do
      @payment = FactoryGirl.build(:payment, :amount => 3)
      @payment.save.should_not be_true
      @payment2 = FactoryGirl.build(:payment, :amount => 10)
      @payment2.save.should be_true
    end
  end
end

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

    it "can get the min payment from config" do
      @min = Growstuff::Application.config.min_payment
      @min.should eq 10
    end

    it "must be greater than or equal to min_payment" do
      @min = Growstuff::Application.config.min_payment
      @payment = FactoryGirl.build(:payment, :amount => @min-1)
      @payment.save.should_not be_true
      @payment2 = FactoryGirl.build(:payment, :amount => @min)
      @payment2.save.should be_true
    end
  end
end

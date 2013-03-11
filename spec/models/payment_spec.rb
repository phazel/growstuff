require 'spec_helper'

describe Payment do

  it "has a payer" do
    @payment = FactoryGirl.create(:payment)
    @payment.payer.should be_an_instance_of Member
  end
end

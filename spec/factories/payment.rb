FactoryGirl.define do

  factory :payment do
    payer
    recipient
    amount 25.00
  end

end

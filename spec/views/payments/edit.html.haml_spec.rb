require 'spec_helper'

describe "payments/edit" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :payer_id => 1,
      :recipient_id => 1,
      :amount => "9.99"
    ))
  end

  it "renders the edit payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path(@payment), :method => "post" do
      assert_select "input#payment_payer_id", :name => "payment[payer_id]"
      assert_select "input#payment_recipient_id", :name => "payment[recipient_id]"
      assert_select "input#payment_amount", :name => "payment[amount]"
    end
  end
end

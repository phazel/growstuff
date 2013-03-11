require 'spec_helper'

describe PaymentsController do

  def valid_attributes
    { "payer_id" => "1" }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all payments as @payments" do
      payment = Payment.create! valid_attributes
      get :index, {}, valid_session
      assigns(:payments).should eq([payment])
    end
  end

  describe "GET show" do
    it "assigns the requested payment as @payment" do
      payment = Payment.create! valid_attributes
      get :show, {:id => payment.to_param}, valid_session
      assigns(:payment).should eq(payment)
    end
  end

  describe "GET new" do
    it "assigns a new payment as @payment" do
      get :new, {}, valid_session
      assigns(:payment).should be_a_new(Payment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Payment" do
        expect {
          post :create, {:payment => valid_attributes}, valid_session
        }.to change(Payment, :count).by(1)
      end

      it "assigns a newly created payment as @payment" do
        post :create, {:payment => valid_attributes}, valid_session
        assigns(:payment).should be_a(Payment)
        assigns(:payment).should be_persisted
      end

      it "redirects to the created payment" do
        post :create, {:payment => valid_attributes}, valid_session
        response.should redirect_to(Payment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment as @payment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Payment.any_instance.stub(:save).and_return(false)
        post :create, {:payment => { "payer_id" => "invalid value" }}, valid_session
        assigns(:payment).should be_a_new(Payment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Payment.any_instance.stub(:save).and_return(false)
        post :create, {:payment => { "payer_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "invalid actions" do
    it "doesn't show edit page" do
      lambda {get :edit, {:payment => valid_attributes}, valid_session}.should raise_error
    end

    it "doesn't allow updates" do
      lambda {put :update, {:payment => valid_attribues}, valid_session}.should raise_error
    end

    it "doesn't allow deletes" do
      lambda {delete :destroy, {:payment => valid_attribues}, valid_session}.should raise_error
    end
  end

end

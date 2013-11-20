require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe InvoicesController do

  # This should return the minimal set of attributes required to create a valid
  # Invoice. As you add validations to Invoice, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { 
    { "invoice_number" => "2013/11/19/CA/wrh7",
      "purchase_date" => "2013-11-12" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InvoicesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    FactoryGirl.create(:user)
  end

  describe "GET index" do
    it "assigns all invoices as @invoices" do
      invoice = Invoice.create! valid_attributes
      get :index, {}, valid_session
      assigns(:invoices).should eq([invoice])
    end
  end

  describe "GET show" do
    it "assigns the requested invoice as @invoice" do
      invoice = Invoice.create! valid_attributes
      get :show, {:id => invoice.to_param}, valid_session
      assigns(:invoice).should eq(invoice)
    end
  end

  describe "GET new" do
    it "assigns a new invoice as @invoice" do
      get :new, {}, valid_session
      assigns(:invoice).should be_a_new(Invoice)
    end
  end

  describe "GET edit" do
    it "assigns the requested invoice as @invoice" do
      invoice = Invoice.create! valid_attributes
      get :edit, {:id => invoice.to_param}, valid_session
      assigns(:invoice).should eq(invoice)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Invoice" do
        expect {
          post :create, {:invoice => valid_attributes}, valid_session
        }.to change(Invoice, :count).by(1)
      end

      it "assigns a newly created invoice as @invoice" do
        post :create, {:invoice => valid_attributes}, valid_session
        assigns(:invoice).should be_a(Invoice)
        assigns(:invoice).should be_persisted
      end

      it "redirects to the created invoice" do
        post :create, {:invoice => valid_attributes}, valid_session
        response.should redirect_to(Invoice.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved invoice as @invoice" do
        # Trigger the behavior that occurs when invalid params are submitted
        Invoice.any_instance.stub(:save).and_return(false)
        post :create, {:invoice => { "purchase_date" => "invalid value" }}, valid_session
        assigns(:invoice).should be_a_new(Invoice)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Invoice.any_instance.stub(:save).and_return(false)
        post :create, {:invoice => { "purchase_date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end

    describe "with note specified" do
      it "connects a current user with the note" do
        post :create, invoice: FactoryGirl.attributes_for(:invoice)
          .merge({:invoice_note_attributes => {}})
        Invoice.last.invoice_note.user.name.should_not be_empty
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested invoice" do
        invoice = Invoice.create! valid_attributes
        # Assuming there are no other invoices in the database, this
        # specifies that the Invoice created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Invoice.any_instance.should_receive(:update).with({ "purchase_date" => "2013-11-12" })
        put :update, {:id => invoice.to_param, :invoice => { "purchase_date" => "2013-11-12" }}, valid_session
      end

      it "assigns the requested invoice as @invoice" do
        invoice = Invoice.create! valid_attributes
        put :update, {:id => invoice.to_param, :invoice => valid_attributes}, valid_session
        assigns(:invoice).should eq(invoice)
      end

      it "redirects to the invoice" do
        invoice = Invoice.create! valid_attributes
        put :update, {:id => invoice.to_param, :invoice => valid_attributes}, valid_session
        response.should redirect_to(invoice)
      end
    end

    describe "with invalid params" do
      it "assigns the invoice as @invoice" do
        invoice = Invoice.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Invoice.any_instance.stub(:save).and_return(false)
        put :update, {:id => invoice.to_param, :invoice => { "purchase_date" => "invalid value" }}, valid_session
        assigns(:invoice).should eq(invoice)
      end

      it "re-renders the 'edit' template" do
        invoice = Invoice.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Invoice.any_instance.stub(:save).and_return(false)
        put :update, {:id => invoice.to_param, :invoice => { "purchase_date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end

    describe "with note specified" do
      it "connects a current user with the note", :wip => true do
        invoice = FactoryGirl.create(:invoice)
        put :update, {:id => invoice.to_param, invoice: {:invoice_note_attributes => { "content" => "abc" }}}
        Invoice.last.invoice_note.user.name.should_not be_empty
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested invoice" do
      invoice = Invoice.create! valid_attributes
      expect {
        delete :destroy, {:id => invoice.to_param}, valid_session
      }.to change(Invoice, :count).by(-1)
    end

    it "redirects to the invoices list" do
      invoice = Invoice.create! valid_attributes
      delete :destroy, {:id => invoice.to_param}, valid_session
      response.should redirect_to(invoices_url)
    end
  end

end

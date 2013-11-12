require "spec_helper"

describe InvoiceNotesController do
  describe "routing" do

    it "routes to #index" do
      get("/invoice_notes").should route_to("invoice_notes#index")
    end

    it "routes to #new" do
      get("/invoice_notes/new").should route_to("invoice_notes#new")
    end

    it "routes to #show" do
      get("/invoice_notes/1").should route_to("invoice_notes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/invoice_notes/1/edit").should route_to("invoice_notes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/invoice_notes").should route_to("invoice_notes#create")
    end

    it "routes to #update" do
      put("/invoice_notes/1").should route_to("invoice_notes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/invoice_notes/1").should route_to("invoice_notes#destroy", :id => "1")
    end

  end
end

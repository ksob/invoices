require 'spec_helper'

describe "InvoiceNotes" do
  describe "GET /invoice_notes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get invoice_notes_path
      response.status.should be(200)
    end
  end
end

require 'spec_helper'

describe "invoice_items/show" do
  before(:each) do
    @invoice_item = assign(:invoice_item, stub_model(InvoiceItem,
      :price => "9.99",
      :name => "Name",
      :invoice => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end

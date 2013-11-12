require 'spec_helper'

describe "invoice_items/index" do
  before(:each) do
    assign(:invoice_items, [
      stub_model(InvoiceItem,
        :price => "9.99",
        :name => "Name",
        :invoice => nil
      ),
      stub_model(InvoiceItem,
        :price => "9.99",
        :name => "Name",
        :invoice => nil
      )
    ])
  end

  it "renders a list of invoice_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

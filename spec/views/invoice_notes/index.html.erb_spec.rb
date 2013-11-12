require 'spec_helper'

describe "invoice_notes/index" do
  before(:each) do
    assign(:invoice_notes, [
      stub_model(InvoiceNote,
        :content => "MyText",
        :user => nil,
        :invoice => nil
      ),
      stub_model(InvoiceNote,
        :content => "MyText",
        :user => nil,
        :invoice => nil
      )
    ])
  end

  it "renders a list of invoice_notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

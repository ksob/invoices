require 'spec_helper'

describe "invoice_notes/show" do
  before(:each) do
    @invoice_note = assign(:invoice_note, stub_model(InvoiceNote,
      :content => "MyText",
      :user => nil,
      :invoice => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
  end
end

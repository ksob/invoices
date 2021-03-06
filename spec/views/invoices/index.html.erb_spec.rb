require 'spec_helper'

describe "invoices/index" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :payment_period => "Payment Period",
        :invoice_number => 1
      ),
      stub_model(Invoice,
        :payment_period => "Payment Period",
        :invoice_number => 1
      )
    ])
  end

  it "renders a list of invoices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Period".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

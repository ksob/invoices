require 'spec_helper'

describe "invoices/edit" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :payment_period => "MyString",
      :invoice_number => 1
    ))

    assign(:client_names_with_ids, 
      [["John Steward", 1], ["Adrian Armor", 2]]
    )
  end

  it "renders the edit invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do
      assert_select "select#invoice_client_id[name=?]", "invoice[client_id]"
      assert_select "input#invoice_payment_period[name=?]", "invoice[payment_period]"
      assert_select "input#invoice_invoice_number[name=?]", "invoice[invoice_number]"
    end
  end
end

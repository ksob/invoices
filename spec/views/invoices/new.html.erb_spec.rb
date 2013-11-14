require 'spec_helper'

describe "invoices/new" do
  before(:each) do
    assign(:invoice, stub_model(Invoice,
      :payment_period => "MyString",
      :invoice_number => 1
    ).as_new_record)

    assign(:client_names_with_ids, 
      [["John Steward", 1], ["Adrian Armor", 2]]
    )
  end

  it "renders new invoice form" do
    render
#p response
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoices_path, "post" do
      assert_select "select#invoice_client_id[name=?]", "invoice[client_id]"
      assert_select "input#invoice_payment_period[name=?]", "invoice[payment_period]"
      assert_select "input#invoice_invoice_number[name=?]", "invoice[invoice_number]"
      assert_select "input#invoice_invoice_items_attributes_100000_name[name=?]", "invoice[invoice_items_attributes][100000][name]"
      assert_select "input#invoice_invoice_items_attributes_100000_price[name=?]", "invoice[invoice_items_attributes][100000][price]"
    end
  end
end

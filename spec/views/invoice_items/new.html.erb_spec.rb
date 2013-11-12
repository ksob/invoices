require 'spec_helper'

describe "invoice_items/new" do
  before(:each) do
    assign(:invoice_item, stub_model(InvoiceItem,
      :price => "9.99",
      :name => "MyString",
      :invoice => nil
    ).as_new_record)
  end

  it "renders new invoice_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoice_items_path, "post" do
      assert_select "input#invoice_item_price[name=?]", "invoice_item[price]"
      assert_select "input#invoice_item_name[name=?]", "invoice_item[name]"
      assert_select "input#invoice_item_invoice[name=?]", "invoice_item[invoice]"
    end
  end
end

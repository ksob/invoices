require 'spec_helper'

describe "invoice_items/edit" do
  before(:each) do
    @invoice_item = assign(:invoice_item, stub_model(InvoiceItem,
      :price => "9.99",
      :name => "MyString",
      :invoice => nil
    ))
  end

  it "renders the edit invoice_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoice_item_path(@invoice_item), "post" do
      assert_select "input#invoice_item_price[name=?]", "invoice_item[price]"
      assert_select "input#invoice_item_name[name=?]", "invoice_item[name]"
      assert_select "input#invoice_item_invoice[name=?]", "invoice_item[invoice]"
    end
  end
end

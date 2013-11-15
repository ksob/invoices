require 'spec_helper'

describe "invoices/edit" do
  before(:each) do
      assign(:client_names_with_ids, 
        [["John Steward", 1], ["Adrian Armor", 2]]
      )
  end

  context "payment_period, invoice_number and invoice_note are filled in" do
    before(:each) do
      @invoice = FactoryGirl.create(:invoice)
    end

    it "renders saved value for payment_period" do
      render

      assert_select "input#invoice_payment_period[value=?]", "12.11.2013 - 12.12.2013"
    end

    it "renders saved value for invoice_number" do
      render

      assert_select "input#invoice_invoice_number[value=?]", "1234567"
    end

    it "renders saved value for invoice_note" do
      render

      assert_select "textarea#invoice_invoice_note_attributes_content", "Xyz"
    end
  end

  context "no invoice items" do
    before(:each) do
      @invoice = FactoryGirl.create(:invoice)
    end

    it "renders the edit invoice form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do
        assert_select "select#invoice_client_id[name=?]", "invoice[client_id]"
        assert_select "input#invoice_payment_period[name=?]", "invoice[payment_period]"
        assert_select "input#invoice_invoice_number[name=?]", "invoice[invoice_number]"
        assert_select "input#invoice_invoice_items_attributes_100000_name[name=?]", "invoice[invoice_items_attributes][100000][name]"
        assert_select "input#invoice_invoice_items_attributes_100000_price[name=?]", "invoice[invoice_items_attributes][100000][price]"
        assert_select "textarea#invoice_invoice_note_attributes_content[name=?]", "invoice[invoice_note_attributes][content]"
      end
    end

    it "renders correct values for payment_period" do
      render

      assert_select "input#invoice_payment_period[value=?]", "12.11.2013 - 12.12.2013"
    end
  end

  context "5 invoice items" do
    before(:each) do
      @invoice = FactoryGirl.create(:ivoice_with_invoice_items)
    end

    it "renders the edit invoice form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do
        assert_select "select#invoice_client_id[name=?]", "invoice[client_id]"
        assert_select "input#invoice_payment_period[name=?]", "invoice[payment_period]"
        assert_select "input#invoice_invoice_number[name=?]", "invoice[invoice_number]"
        assert_select "input#invoice_invoice_items_attributes_0_name[name=?]", "invoice[invoice_items_attributes][0][name]"
        assert_select "input#invoice_invoice_items_attributes_0_price[name=?]", "invoice[invoice_items_attributes][0][price]"
      end
    end

    it "renders correct values for invoice_items' name" do
      render

      assert_select "input#invoice_invoice_items_attributes_0_name[value=?]", "abc"
    end

    it "renders correct values for invoice_items' price" do
      render

      assert_select "input#invoice_invoice_items_attributes_0_price[value=?]", "123"
    end
  end
end

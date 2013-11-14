require 'spec_helper'

FactoryGirl.define do
  factory :invoice_item do
    price 123
    name "abc"
    invoice
  end

  # user factory without associated posts
  factory :invoice do
    payment_period "12.11.2013 - 12.12.2013"
    invoice_number 1234567

    # user_with_posts will create post data after the user has been created
    factory :ivoice_with_invoice_items do
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        invoice_items_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |invoice, evaluator|
        FactoryGirl.create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
      end
    end
  end
end

describe "invoices/edit" do
  before(:each) do
      assign(:client_names_with_ids, 
        [["John Steward", 1], ["Adrian Armor", 2]]
      )
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
      end
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

    it "renders correct values for payment_period and invoice_number" do
      render

      assert_select "input#invoice_payment_period[value=?]", "12.11.2013 - 12.12.2013"
      assert_select "input#invoice_invoice_number[value=?]", "1234567"
    end

    it "renders correct values for invoice_items" do
      render

      assert_select "input#invoice_invoice_items_attributes_0_name[value=?]", "abc"
      assert_select "input#invoice_invoice_items_attributes_0_price[value=?]", "123"
    end
  end
end

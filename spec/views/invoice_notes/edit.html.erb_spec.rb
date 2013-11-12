require 'spec_helper'

describe "invoice_notes/edit" do
  before(:each) do
    @invoice_note = assign(:invoice_note, stub_model(InvoiceNote,
      :content => "MyText",
      :user => nil,
      :invoice => nil
    ))
  end

  it "renders the edit invoice_note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoice_note_path(@invoice_note), "post" do
      assert_select "textarea#invoice_note_content[name=?]", "invoice_note[content]"
      assert_select "input#invoice_note_user[name=?]", "invoice_note[user]"
      assert_select "input#invoice_note_invoice[name=?]", "invoice_note[invoice]"
    end
  end
end

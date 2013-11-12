require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :name => "MyString",
      :street => "MyString",
      :zip_code => "MyString",
      :city => "MyString",
      :nip => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", client_path(@client), "post" do
      assert_select "input#client_name[name=?]", "client[name]"
      assert_select "input#client_street[name=?]", "client[street]"
      assert_select "input#client_zip_code[name=?]", "client[zip_code]"
      assert_select "input#client_city[name=?]", "client[city]"
      assert_select "input#client_nip[name=?]", "client[nip]"
    end
  end
end

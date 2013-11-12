require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :zip_code => "MyString",
      :city => "MyString",
      :nip => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_zip_code[name=?]", "user[zip_code]"
      assert_select "input#user_city[name=?]", "user[city]"
      assert_select "input#user_nip[name=?]", "user[nip]"
    end
  end
end

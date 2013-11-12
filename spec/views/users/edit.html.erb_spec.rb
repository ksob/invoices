require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :zip_code => "MyString",
      :city => "MyString",
      :nip => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_zip_code[name=?]", "user[zip_code]"
      assert_select "input#user_city[name=?]", "user[city]"
      assert_select "input#user_nip[name=?]", "user[nip]"
    end
  end
end

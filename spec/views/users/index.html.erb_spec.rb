require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :zip_code => "Zip Code",
        :city => "City",
        :nip => "Nip"
      ),
      stub_model(User,
        :name => "Name",
        :zip_code => "Zip Code",
        :city => "City",
        :nip => "Nip"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Nip".to_s, :count => 2
  end
end

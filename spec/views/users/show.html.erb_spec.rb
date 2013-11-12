require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :zip_code => "Zip Code",
      :city => "City",
      :nip => "Nip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Zip Code/)
    rendered.should match(/City/)
    rendered.should match(/Nip/)
  end
end

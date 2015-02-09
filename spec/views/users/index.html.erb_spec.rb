require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :pseudo => "Pseudo",
        :email => "Email"
      ),
      User.create!(
        :pseudo => "Pseudo",
        :email => "Email"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Pseudo".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "royaumes/index", :type => :view do
  before(:each) do
    assign(:royaumes, [
      Royaume.create!(
        :nom => "Nom",
        :description => "MyText"
      ),
      Royaume.create!(
        :nom => "Nom",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of royaumes" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "lieus/index", :type => :view do
  before(:each) do
    assign(:lieus, [
      Lieu.create!(
        :nom => "Nom",
        :description => "Description",
        :type => "Type"
      ),
      Lieu.create!(
        :nom => "Nom",
        :description => "Description",
        :type => "Type"
      )
    ])
  end

  it "renders a list of lieus" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end

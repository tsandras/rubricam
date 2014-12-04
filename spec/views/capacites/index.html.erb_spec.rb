require 'rails_helper'

RSpec.describe "capacites/index", :type => :view do
  before(:each) do
    assign(:capacites, [
      Capacite.create!(
        :cap_nom => "Cap Nom",
        :cap_description => "MyText",
        :cap_primaire => false
      ),
      Capacite.create!(
        :cap_nom => "Cap Nom",
        :cap_description => "MyText",
        :cap_primaire => false
      )
    ])
  end

  it "renders a list of capacites" do
    render
    assert_select "tr>td", :text => "Cap Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

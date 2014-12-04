require 'rails_helper'

RSpec.describe "routines/index", :type => :view do
  before(:each) do
    assign(:routines, [
      Routine.create!(
        :name => "Name",
        :description => "MyText",
        :foci => "MyText",
        :combinaison => "Combinaison",
        :type => "Type"
      ),
      Routine.create!(
        :name => "Name",
        :description => "MyText",
        :foci => "MyText",
        :combinaison => "Combinaison",
        :type => "Type"
      )
    ])
  end

  it "renders a list of routines" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Combinaison".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end

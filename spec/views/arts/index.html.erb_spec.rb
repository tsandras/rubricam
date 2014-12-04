require 'rails_helper'

RSpec.describe "arts/index", :type => :view do
  before(:each) do
    assign(:arts, [
      Art.create!(
        :nom => "Nom",
        :description => "MyText"
      ),
      Art.create!(
        :nom => "Nom",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of arts" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

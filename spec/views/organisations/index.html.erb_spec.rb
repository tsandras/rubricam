require 'rails_helper'

RSpec.describe "organisations/index", :type => :view do
  before(:each) do
    assign(:organisations, [
      Organisation.create!(
        :nom => "Nom",
        :description => "",
        :type => ""
      ),
      Organisation.create!(
        :nom => "Nom",
        :description => "",
        :type => ""
      )
    ])
  end

  it "renders a list of organisations" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end

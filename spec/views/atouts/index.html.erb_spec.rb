require 'rails_helper'

RSpec.describe "atouts/index", :type => :view do
  before(:each) do
    assign(:atouts, [
      Atout.create!(
        :nom => "Nom",
        :description => "MyText",
        :cout => 1
      ),
      Atout.create!(
        :nom => "Nom",
        :description => "MyText",
        :cout => 1
      )
    ])
  end

  it "renders a list of atouts" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

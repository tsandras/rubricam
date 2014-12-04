require 'rails_helper'

RSpec.describe "historiques/index", :type => :view do
  before(:each) do
    assign(:historiques, [
      Historique.create!(
        :nom => "Nom",
        :description => "MyText"
      ),
      Historique.create!(
        :nom => "Nom",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of historiques" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

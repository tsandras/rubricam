require 'rails_helper'

RSpec.describe "combinaisons/index", :type => :view do
  before(:each) do
    assign(:combinaisons, [
      Combinaison.create!(
        :nom => "Nom",
        :description => "MyText",
        :niveau => 1
      ),
      Combinaison.create!(
        :nom => "Nom",
        :description => "MyText",
        :niveau => 1
      )
    ])
  end

  it "renders a list of combinaisons" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

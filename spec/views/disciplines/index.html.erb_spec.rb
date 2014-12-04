require 'rails_helper'

RSpec.describe "disciplines/index", :type => :view do
  before(:each) do
    assign(:disciplines, [
      Discipline.create!(
        :nom => "Nom",
        :description => "MyText",
        :niveau => 1,
        :nom_discipline => "Nom Discipline"
      ),
      Discipline.create!(
        :nom => "Nom",
        :description => "MyText",
        :niveau => 1,
        :nom_discipline => "Nom Discipline"
      )
    ])
  end

  it "renders a list of disciplines" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Nom Discipline".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "objets/index", :type => :view do
  before(:each) do
    assign(:objets, [
      Objet.create!(
        :name => "Name",
        :description => "MyText",
        :niveau => 1,
        :type => "Type",
        :resonnance => "Resonnance",
        :personnage_id => "Personnage"
      ),
      Objet.create!(
        :name => "Name",
        :description => "MyText",
        :niveau => 1,
        :type => "Type",
        :resonnance => "Resonnance",
        :personnage_id => "Personnage"
      )
    ])
  end

  it "renders a list of objets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Resonnance".to_s, :count => 2
    assert_select "tr>td", :text => "Personnage".to_s, :count => 2
  end
end

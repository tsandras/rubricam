require 'rails_helper'

RSpec.describe "nivarts/index", :type => :view do
  before(:each) do
    assign(:nivarts, [
      Nivart.create!(
        :art_id => 1,
        :art_nom => "Art Nom",
        :nom => "Nom",
        :niveau => 2,
        :description => "MyText",
        :source => "Source",
        :systeme => "MyText",
        :tableau => "MyText",
        :secret => false
      ),
      Nivart.create!(
        :art_id => 1,
        :art_nom => "Art Nom",
        :nom => "Nom",
        :niveau => 2,
        :description => "MyText",
        :source => "Source",
        :systeme => "MyText",
        :tableau => "MyText",
        :secret => false
      )
    ])
  end

  it "renders a list of nivarts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Art Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

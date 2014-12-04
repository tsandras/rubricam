require 'rails_helper'

RSpec.describe "spheres/index", :type => :view do
  before(:each) do
    assign(:spheres, [
      Sphere.create!(
        :name => "Name",
        :specialite => "Specialite",
        :description => "MyText",
        :niveau => 1,
        :personnage_id => 2
      ),
      Sphere.create!(
        :name => "Name",
        :specialite => "Specialite",
        :description => "MyText",
        :niveau => 1,
        :personnage_id => 2
      )
    ])
  end

  it "renders a list of spheres" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Specialite".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

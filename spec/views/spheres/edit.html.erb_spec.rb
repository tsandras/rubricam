require 'rails_helper'

RSpec.describe "spheres/edit", :type => :view do
  before(:each) do
    @sphere = assign(:sphere, Sphere.create!(
      :name => "MyString",
      :specialite => "MyString",
      :description => "MyText",
      :niveau => 1,
      :personnage_id => 1
    ))
  end

  it "renders the edit sphere form" do
    render

    assert_select "form[action=?][method=?]", sphere_path(@sphere), "post" do

      assert_select "input#sphere_name[name=?]", "sphere[name]"

      assert_select "input#sphere_specialite[name=?]", "sphere[specialite]"

      assert_select "textarea#sphere_description[name=?]", "sphere[description]"

      assert_select "input#sphere_niveau[name=?]", "sphere[niveau]"

      assert_select "input#sphere_personnage_id[name=?]", "sphere[personnage_id]"
    end
  end
end

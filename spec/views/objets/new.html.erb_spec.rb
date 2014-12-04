require 'rails_helper'

RSpec.describe "objets/new", :type => :view do
  before(:each) do
    assign(:objet, Objet.new(
      :name => "MyString",
      :description => "MyText",
      :niveau => 1,
      :type => "",
      :resonnance => "MyString",
      :personnage_id => "MyString"
    ))
  end

  it "renders new objet form" do
    render

    assert_select "form[action=?][method=?]", objets_path, "post" do

      assert_select "input#objet_name[name=?]", "objet[name]"

      assert_select "textarea#objet_description[name=?]", "objet[description]"

      assert_select "input#objet_niveau[name=?]", "objet[niveau]"

      assert_select "input#objet_type[name=?]", "objet[type]"

      assert_select "input#objet_resonnance[name=?]", "objet[resonnance]"

      assert_select "input#objet_personnage_id[name=?]", "objet[personnage_id]"
    end
  end
end

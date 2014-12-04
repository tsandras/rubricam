require 'rails_helper'

RSpec.describe "objets/edit", :type => :view do
  before(:each) do
    @objet = assign(:objet, Objet.create!(
      :name => "MyString",
      :description => "MyText",
      :niveau => 1,
      :type => "",
      :resonnance => "MyString",
      :personnage_id => "MyString"
    ))
  end

  it "renders the edit objet form" do
    render

    assert_select "form[action=?][method=?]", objet_path(@objet), "post" do

      assert_select "input#objet_name[name=?]", "objet[name]"

      assert_select "textarea#objet_description[name=?]", "objet[description]"

      assert_select "input#objet_niveau[name=?]", "objet[niveau]"

      assert_select "input#objet_type[name=?]", "objet[type]"

      assert_select "input#objet_resonnance[name=?]", "objet[resonnance]"

      assert_select "input#objet_personnage_id[name=?]", "objet[personnage_id]"
    end
  end
end

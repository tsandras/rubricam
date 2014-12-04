require 'rails_helper'

RSpec.describe "combinaisons/new", :type => :view do
  before(:each) do
    assign(:combinaison, Combinaison.new(
      :nom => "MyString",
      :description => "MyText",
      :niveau => 1
    ))
  end

  it "renders new combinaison form" do
    render

    assert_select "form[action=?][method=?]", combinaisons_path, "post" do

      assert_select "input#combinaison_nom[name=?]", "combinaison[nom]"

      assert_select "textarea#combinaison_description[name=?]", "combinaison[description]"

      assert_select "input#combinaison_niveau[name=?]", "combinaison[niveau]"
    end
  end
end

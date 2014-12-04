require 'rails_helper'

RSpec.describe "combinaisons/edit", :type => :view do
  before(:each) do
    @combinaison = assign(:combinaison, Combinaison.create!(
      :nom => "MyString",
      :description => "MyText",
      :niveau => 1
    ))
  end

  it "renders the edit combinaison form" do
    render

    assert_select "form[action=?][method=?]", combinaison_path(@combinaison), "post" do

      assert_select "input#combinaison_nom[name=?]", "combinaison[nom]"

      assert_select "textarea#combinaison_description[name=?]", "combinaison[description]"

      assert_select "input#combinaison_niveau[name=?]", "combinaison[niveau]"
    end
  end
end

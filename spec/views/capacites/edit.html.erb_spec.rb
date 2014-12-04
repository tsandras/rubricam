require 'rails_helper'

RSpec.describe "capacites/edit", :type => :view do
  before(:each) do
    @capacite = assign(:capacite, Capacite.create!(
      :cap_nom => "MyString",
      :cap_description => "MyText",
      :cap_primaire => false
    ))
  end

  it "renders the edit capacite form" do
    render

    assert_select "form[action=?][method=?]", capacite_path(@capacite), "post" do

      assert_select "input#capacite_cap_nom[name=?]", "capacite[cap_nom]"

      assert_select "textarea#capacite_cap_description[name=?]", "capacite[cap_description]"

      assert_select "input#capacite_cap_primaire[name=?]", "capacite[cap_primaire]"
    end
  end
end

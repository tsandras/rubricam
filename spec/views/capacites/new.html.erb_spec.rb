require 'rails_helper'

RSpec.describe "capacites/new", :type => :view do
  before(:each) do
    assign(:capacite, Capacite.new(
      :cap_nom => "MyString",
      :cap_description => "MyText",
      :cap_primaire => false
    ))
  end

  it "renders new capacite form" do
    render

    assert_select "form[action=?][method=?]", capacites_path, "post" do

      assert_select "input#capacite_cap_nom[name=?]", "capacite[cap_nom]"

      assert_select "textarea#capacite_cap_description[name=?]", "capacite[cap_description]"

      assert_select "input#capacite_cap_primaire[name=?]", "capacite[cap_primaire]"
    end
  end
end

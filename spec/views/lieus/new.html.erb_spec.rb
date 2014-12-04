require 'rails_helper'

RSpec.describe "lieus/new", :type => :view do
  before(:each) do
    assign(:lieu, Lieu.new(
      :nom => "MyString",
      :description => "MyString",
      :type => ""
    ))
  end

  it "renders new lieu form" do
    render

    assert_select "form[action=?][method=?]", lieus_path, "post" do

      assert_select "input#lieu_nom[name=?]", "lieu[nom]"

      assert_select "input#lieu_description[name=?]", "lieu[description]"

      assert_select "input#lieu_type[name=?]", "lieu[type]"
    end
  end
end

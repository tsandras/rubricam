require 'rails_helper'

RSpec.describe "arts/new", :type => :view do
  before(:each) do
    assign(:art, Art.new(
      :nom => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new art form" do
    render

    assert_select "form[action=?][method=?]", arts_path, "post" do

      assert_select "input#art_nom[name=?]", "art[nom]"

      assert_select "textarea#art_description[name=?]", "art[description]"
    end
  end
end

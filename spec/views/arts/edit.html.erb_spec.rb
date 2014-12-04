require 'rails_helper'

RSpec.describe "arts/edit", :type => :view do
  before(:each) do
    @art = assign(:art, Art.create!(
      :nom => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit art form" do
    render

    assert_select "form[action=?][method=?]", art_path(@art), "post" do

      assert_select "input#art_nom[name=?]", "art[nom]"

      assert_select "textarea#art_description[name=?]", "art[description]"
    end
  end
end

require 'rails_helper'

RSpec.describe "lieus/edit", :type => :view do
  before(:each) do
    @lieu = assign(:lieu, Lieu.create!(
      :nom => "MyString",
      :description => "MyString",
      :type => ""
    ))
  end

  it "renders the edit lieu form" do
    render

    assert_select "form[action=?][method=?]", lieu_path(@lieu), "post" do

      assert_select "input#lieu_nom[name=?]", "lieu[nom]"

      assert_select "input#lieu_description[name=?]", "lieu[description]"

      assert_select "input#lieu_type[name=?]", "lieu[type]"
    end
  end
end

require 'rails_helper'

RSpec.describe "royaumes/edit", :type => :view do
  before(:each) do
    @royaume = assign(:royaume, Royaume.create!(
      :nom => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit royaume form" do
    render

    assert_select "form[action=?][method=?]", royaume_path(@royaume), "post" do

      assert_select "input#royaume_nom[name=?]", "royaume[nom]"

      assert_select "textarea#royaume_description[name=?]", "royaume[description]"
    end
  end
end

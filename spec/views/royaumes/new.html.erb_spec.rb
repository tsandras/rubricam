require 'rails_helper'

RSpec.describe "royaumes/new", :type => :view do
  before(:each) do
    assign(:royaume, Royaume.new(
      :nom => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new royaume form" do
    render

    assert_select "form[action=?][method=?]", royaumes_path, "post" do

      assert_select "input#royaume_nom[name=?]", "royaume[nom]"

      assert_select "textarea#royaume_description[name=?]", "royaume[description]"
    end
  end
end

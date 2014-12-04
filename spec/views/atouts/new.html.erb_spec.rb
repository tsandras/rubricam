require 'rails_helper'

RSpec.describe "atouts/new", :type => :view do
  before(:each) do
    assign(:atout, Atout.new(
      :nom => "MyString",
      :description => "MyText",
      :cout => 1
    ))
  end

  it "renders new atout form" do
    render

    assert_select "form[action=?][method=?]", atouts_path, "post" do

      assert_select "input#atout_nom[name=?]", "atout[nom]"

      assert_select "textarea#atout_description[name=?]", "atout[description]"

      assert_select "input#atout_cout[name=?]", "atout[cout]"
    end
  end
end

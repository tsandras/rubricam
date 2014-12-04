require 'rails_helper'

RSpec.describe "atouts/edit", :type => :view do
  before(:each) do
    @atout = assign(:atout, Atout.create!(
      :nom => "MyString",
      :description => "MyText",
      :cout => 1
    ))
  end

  it "renders the edit atout form" do
    render

    assert_select "form[action=?][method=?]", atout_path(@atout), "post" do

      assert_select "input#atout_nom[name=?]", "atout[nom]"

      assert_select "textarea#atout_description[name=?]", "atout[description]"

      assert_select "input#atout_cout[name=?]", "atout[cout]"
    end
  end
end

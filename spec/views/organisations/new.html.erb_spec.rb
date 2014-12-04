require 'rails_helper'

RSpec.describe "organisations/new", :type => :view do
  before(:each) do
    assign(:organisation, Organisation.new(
      :nom => "MyString",
      :description => "",
      :type => ""
    ))
  end

  it "renders new organisation form" do
    render

    assert_select "form[action=?][method=?]", organisations_path, "post" do

      assert_select "input#organisation_nom[name=?]", "organisation[nom]"

      assert_select "input#organisation_description[name=?]", "organisation[description]"

      assert_select "input#organisation_type[name=?]", "organisation[type]"
    end
  end
end

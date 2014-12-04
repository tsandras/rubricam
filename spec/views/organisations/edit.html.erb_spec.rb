require 'rails_helper'

RSpec.describe "organisations/edit", :type => :view do
  before(:each) do
    @organisation = assign(:organisation, Organisation.create!(
      :nom => "MyString",
      :description => "",
      :type => ""
    ))
  end

  it "renders the edit organisation form" do
    render

    assert_select "form[action=?][method=?]", organisation_path(@organisation), "post" do

      assert_select "input#organisation_nom[name=?]", "organisation[nom]"

      assert_select "input#organisation_description[name=?]", "organisation[description]"

      assert_select "input#organisation_type[name=?]", "organisation[type]"
    end
  end
end

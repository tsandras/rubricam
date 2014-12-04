require 'rails_helper'

RSpec.describe "organisations/show", :type => :view do
  before(:each) do
    @organisation = assign(:organisation, Organisation.create!(
      :nom => "Nom",
      :description => "",
      :type => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

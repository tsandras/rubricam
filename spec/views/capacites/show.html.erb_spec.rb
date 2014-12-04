require 'rails_helper'

RSpec.describe "capacites/show", :type => :view do
  before(:each) do
    @capacite = assign(:capacite, Capacite.create!(
      :cap_nom => "Cap Nom",
      :cap_description => "MyText",
      :cap_primaire => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cap Nom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end

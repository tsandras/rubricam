require 'rails_helper'

RSpec.describe "lieus/show", :type => :view do
  before(:each) do
    @lieu = assign(:lieu, Lieu.create!(
      :nom => "Nom",
      :description => "Description",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Type/)
  end
end

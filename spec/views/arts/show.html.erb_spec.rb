require 'rails_helper'

RSpec.describe "arts/show", :type => :view do
  before(:each) do
    @art = assign(:art, Art.create!(
      :nom => "Nom",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
  end
end

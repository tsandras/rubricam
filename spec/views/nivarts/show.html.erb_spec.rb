require 'rails_helper'

RSpec.describe "nivarts/show", :type => :view do
  before(:each) do
    @nivart = assign(:nivart, Nivart.create!(
      :art_id => 1,
      :art_nom => "Art Nom",
      :nom => "Nom",
      :niveau => 2,
      :description => "MyText",
      :source => "Source",
      :systeme => "MyText",
      :tableau => "MyText",
      :secret => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Art Nom/)
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end

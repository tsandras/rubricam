require 'rails_helper'

RSpec.describe "combinaisons/show", :type => :view do
  before(:each) do
    @combinaison = assign(:combinaison, Combinaison.create!(
      :nom => "Nom",
      :description => "MyText",
      :niveau => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end

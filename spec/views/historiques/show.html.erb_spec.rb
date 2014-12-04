require 'rails_helper'

RSpec.describe "historiques/show", :type => :view do
  before(:each) do
    @historique = assign(:historique, Historique.create!(
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

require 'rails_helper'

RSpec.describe "objets/show", :type => :view do
  before(:each) do
    @objet = assign(:objet, Objet.create!(
      :name => "Name",
      :description => "MyText",
      :niveau => 1,
      :type => "Type",
      :resonnance => "Resonnance",
      :personnage_id => "Personnage"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Resonnance/)
    expect(rendered).to match(/Personnage/)
  end
end

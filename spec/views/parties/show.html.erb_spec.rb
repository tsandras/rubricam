require 'rails_helper'

RSpec.describe "parties/show", :type => :view do
  before(:each) do
    @partie = assign(:partie, Partie.create!(
      :duree => "",
      :nom => "Nom",
      :description => "MyText",
      :description_publique => "MyText",
      :secret => false,
      :image_lien => "Image Lien",
      :xps => 1,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Image Lien/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end

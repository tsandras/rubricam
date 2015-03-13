require 'rails_helper'

RSpec.describe "parties/index", :type => :view do
  before(:each) do
    assign(:parties, [
      Partie.create!(
        :duree => "",
        :nom => "Nom",
        :description => "MyText",
        :description_publique => "MyText",
        :secret => false,
        :image_lien => "Image Lien",
        :xps => 1,
        :notes => "MyText"
      ),
      Partie.create!(
        :duree => "",
        :nom => "Nom",
        :description => "MyText",
        :description_publique => "MyText",
        :secret => false,
        :image_lien => "Image Lien",
        :xps => 1,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of parties" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Image Lien".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

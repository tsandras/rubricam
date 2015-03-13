require 'rails_helper'

RSpec.describe "parties/new", :type => :view do
  before(:each) do
    assign(:partie, Partie.new(
      :duree => "",
      :nom => "MyString",
      :description => "MyText",
      :description_publique => "MyText",
      :secret => false,
      :image_lien => "MyString",
      :xps => 1,
      :notes => "MyText"
    ))
  end

  it "renders new partie form" do
    render

    assert_select "form[action=?][method=?]", parties_path, "post" do

      assert_select "input#partie_duree[name=?]", "partie[duree]"

      assert_select "input#partie_nom[name=?]", "partie[nom]"

      assert_select "textarea#partie_description[name=?]", "partie[description]"

      assert_select "textarea#partie_description_publique[name=?]", "partie[description_publique]"

      assert_select "input#partie_secret[name=?]", "partie[secret]"

      assert_select "input#partie_image_lien[name=?]", "partie[image_lien]"

      assert_select "input#partie_xps[name=?]", "partie[xps]"

      assert_select "textarea#partie_notes[name=?]", "partie[notes]"
    end
  end
end

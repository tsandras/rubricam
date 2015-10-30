require 'rails_helper'

RSpec.describe "nivarts/new", :type => :view do
  before(:each) do
    assign(:nivart, Nivart.new(
      :art_id => 1,
      :art_nom => "MyString",
      :nom => "MyString",
      :niveau => 1,
      :description => "MyText",
      :source => "MyString",
      :systeme => "MyText",
      :tableau => "MyText",
      :secret => false
    ))
  end

  it "renders new nivart form" do
    render

    assert_select "form[action=?][method=?]", nivarts_path, "post" do

      assert_select "input#nivart_art_id[name=?]", "nivart[art_id]"

      assert_select "input#nivart_art_nom[name=?]", "nivart[art_nom]"

      assert_select "input#nivart_nom[name=?]", "nivart[nom]"

      assert_select "input#nivart_niveau[name=?]", "nivart[niveau]"

      assert_select "textarea#nivart_description[name=?]", "nivart[description]"

      assert_select "input#nivart_source[name=?]", "nivart[source]"

      assert_select "textarea#nivart_systeme[name=?]", "nivart[systeme]"

      assert_select "textarea#nivart_tableau[name=?]", "nivart[tableau]"

      assert_select "input#nivart_secret[name=?]", "nivart[secret]"
    end
  end
end

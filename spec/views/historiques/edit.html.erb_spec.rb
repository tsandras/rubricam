require 'rails_helper'

RSpec.describe "historiques/edit", :type => :view do
  before(:each) do
    @historique = assign(:historique, Historique.create!(
      :nom => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit historique form" do
    render

    assert_select "form[action=?][method=?]", historique_path(@historique), "post" do

      assert_select "input#historique_nom[name=?]", "historique[nom]"

      assert_select "textarea#historique_description[name=?]", "historique[description]"
    end
  end
end

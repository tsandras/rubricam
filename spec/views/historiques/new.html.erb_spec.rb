require 'rails_helper'

RSpec.describe "historiques/new", :type => :view do
  before(:each) do
    assign(:historique, Historique.new(
      :nom => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new historique form" do
    render

    assert_select "form[action=?][method=?]", historiques_path, "post" do

      assert_select "input#historique_nom[name=?]", "historique[nom]"

      assert_select "textarea#historique_description[name=?]", "historique[description]"
    end
  end
end

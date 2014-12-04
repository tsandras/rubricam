require 'rails_helper'

RSpec.describe "disciplines/new", :type => :view do
  before(:each) do
    assign(:discipline, Discipline.new(
      :nom => "MyString",
      :description => "MyText",
      :niveau => 1,
      :nom_discipline => "MyString"
    ))
  end

  it "renders new discipline form" do
    render

    assert_select "form[action=?][method=?]", disciplines_path, "post" do

      assert_select "input#discipline_nom[name=?]", "discipline[nom]"

      assert_select "textarea#discipline_description[name=?]", "discipline[description]"

      assert_select "input#discipline_niveau[name=?]", "discipline[niveau]"

      assert_select "input#discipline_nom_discipline[name=?]", "discipline[nom_discipline]"
    end
  end
end

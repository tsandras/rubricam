require 'rails_helper'

RSpec.describe "routines/edit", :type => :view do
  before(:each) do
    @routine = assign(:routine, Routine.create!(
      :name => "MyString",
      :description => "MyText",
      :foci => "MyText",
      :combinaison => "MyString",
      :type => ""
    ))
  end

  it "renders the edit routine form" do
    render

    assert_select "form[action=?][method=?]", routine_path(@routine), "post" do

      assert_select "input#routine_name[name=?]", "routine[name]"

      assert_select "textarea#routine_description[name=?]", "routine[description]"

      assert_select "textarea#routine_foci[name=?]", "routine[foci]"

      assert_select "input#routine_combinaison[name=?]", "routine[combinaison]"

      assert_select "input#routine_type[name=?]", "routine[type]"
    end
  end
end

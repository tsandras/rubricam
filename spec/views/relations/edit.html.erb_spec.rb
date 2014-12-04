require 'rails_helper'

RSpec.describe "relations/edit", :type => :view do
  before(:each) do
    @relation = assign(:relation, Relation.create!(
      :name => "MyString",
      :description => ""
    ))
  end

  it "renders the edit relation form" do
    render

    assert_select "form[action=?][method=?]", relation_path(@relation), "post" do

      assert_select "input#relation_name[name=?]", "relation[name]"

      assert_select "input#relation_description[name=?]", "relation[description]"
    end
  end
end

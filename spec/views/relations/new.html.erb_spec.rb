require 'rails_helper'

RSpec.describe "relations/new", :type => :view do
  before(:each) do
    assign(:relation, Relation.new(
      :name => "MyString",
      :description => ""
    ))
  end

  it "renders new relation form" do
    render

    assert_select "form[action=?][method=?]", relations_path, "post" do

      assert_select "input#relation_name[name=?]", "relation[name]"

      assert_select "input#relation_description[name=?]", "relation[description]"
    end
  end
end

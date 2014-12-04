require 'rails_helper'

RSpec.describe "relations/index", :type => :view do
  before(:each) do
    assign(:relations, [
      Relation.create!(
        :name => "Name",
        :description => ""
      ),
      Relation.create!(
        :name => "Name",
        :description => ""
      )
    ])
  end

  it "renders a list of relations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "relations/show", :type => :view do
  before(:each) do
    @relation = assign(:relation, Relation.create!(
      :name => "Name",
      :description => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end

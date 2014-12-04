require 'rails_helper'

RSpec.describe "royaumes/show", :type => :view do
  before(:each) do
    @royaume = assign(:royaume, Royaume.create!(
      :nom => "Nom",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
  end
end

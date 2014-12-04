require 'rails_helper'

RSpec.describe "atouts/show", :type => :view do
  before(:each) do
    @atout = assign(:atout, Atout.create!(
      :nom => "Nom",
      :description => "MyText",
      :cout => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end

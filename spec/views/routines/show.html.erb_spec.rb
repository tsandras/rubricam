require 'rails_helper'

RSpec.describe "routines/show", :type => :view do
  before(:each) do
    @routine = assign(:routine, Routine.create!(
      :name => "Name",
      :description => "MyText",
      :foci => "MyText",
      :combinaison => "Combinaison",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Combinaison/)
    expect(rendered).to match(/Type/)
  end
end

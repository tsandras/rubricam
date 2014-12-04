require 'rails_helper'

RSpec.describe "spheres/show", :type => :view do
  before(:each) do
    @sphere = assign(:sphere, Sphere.create!(
      :name => "Name",
      :specialite => "Specialite",
      :description => "MyText",
      :niveau => 1,
      :personnage_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Specialite/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end

require 'rails_helper'

RSpec.describe "nodes/show", :type => :view do
  before(:each) do
    @node = assign(:node, Node.create!(
      :nom => "Nom",
      :description => "MyText",
      :sup => "MyText",
      :niveau => 1,
      :dynamique => 2,
      :statique => 3,
      :entropique => 4,
      :spec_dynamique => "Spec Dynamique",
      :spec_statique => "Spec Statique",
      :spec_entropique => "Spec Entropique",
      :lieu_id => 5,
      :personnage_id => 6,
      :secret => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Spec Dynamique/)
    expect(rendered).to match(/Spec Statique/)
    expect(rendered).to match(/Spec Entropique/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/false/)
  end
end

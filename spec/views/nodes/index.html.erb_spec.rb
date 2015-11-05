require 'rails_helper'

RSpec.describe "nodes/index", :type => :view do
  before(:each) do
    assign(:nodes, [
      Node.create!(
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
      ),
      Node.create!(
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
      )
    ])
  end

  it "renders a list of nodes" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Spec Dynamique".to_s, :count => 2
    assert_select "tr>td", :text => "Spec Statique".to_s, :count => 2
    assert_select "tr>td", :text => "Spec Entropique".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

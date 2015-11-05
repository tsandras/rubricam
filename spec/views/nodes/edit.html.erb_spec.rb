require 'rails_helper'

RSpec.describe "nodes/edit", :type => :view do
  before(:each) do
    @node = assign(:node, Node.create!(
      :nom => "MyString",
      :description => "MyText",
      :sup => "MyText",
      :niveau => 1,
      :dynamique => 1,
      :statique => 1,
      :entropique => 1,
      :spec_dynamique => "MyString",
      :spec_statique => "MyString",
      :spec_entropique => "MyString",
      :lieu_id => 1,
      :personnage_id => 1,
      :secret => false
    ))
  end

  it "renders the edit node form" do
    render

    assert_select "form[action=?][method=?]", node_path(@node), "post" do

      assert_select "input#node_nom[name=?]", "node[nom]"

      assert_select "textarea#node_description[name=?]", "node[description]"

      assert_select "textarea#node_sup[name=?]", "node[sup]"

      assert_select "input#node_niveau[name=?]", "node[niveau]"

      assert_select "input#node_dynamique[name=?]", "node[dynamique]"

      assert_select "input#node_statique[name=?]", "node[statique]"

      assert_select "input#node_entropique[name=?]", "node[entropique]"

      assert_select "input#node_spec_dynamique[name=?]", "node[spec_dynamique]"

      assert_select "input#node_spec_statique[name=?]", "node[spec_statique]"

      assert_select "input#node_spec_entropique[name=?]", "node[spec_entropique]"

      assert_select "input#node_lieu_id[name=?]", "node[lieu_id]"

      assert_select "input#node_personnage_id[name=?]", "node[personnage_id]"

      assert_select "input#node_secret[name=?]", "node[secret]"
    end
  end
end

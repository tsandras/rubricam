require 'rails_helper'

RSpec.describe "transactions/edit", :type => :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :to_personnage_id => 1,
      :from_personnage_id => 1
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_to_personnage_id[name=?]", "transaction[to_personnage_id]"

      assert_select "input#transaction_from_personnage_id[name=?]", "transaction[from_personnage_id]"
    end
  end
end

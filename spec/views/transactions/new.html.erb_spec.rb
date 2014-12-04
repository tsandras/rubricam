require 'rails_helper'

RSpec.describe "transactions/new", :type => :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :to_personnage_id => 1,
      :from_personnage_id => 1
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_to_personnage_id[name=?]", "transaction[to_personnage_id]"

      assert_select "input#transaction_from_personnage_id[name=?]", "transaction[from_personnage_id]"
    end
  end
end

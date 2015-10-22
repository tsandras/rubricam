require 'rails_helper'

RSpec.describe "version_comments/index", :type => :view do
  before(:each) do
    assign(:version_comments, [
      VersionComment.create!(
        :version => "9.99",
        :content => "MyText",
        :details => "MyText"
      ),
      VersionComment.create!(
        :version => "9.99",
        :content => "MyText",
        :details => "MyText"
      )
    ])
  end

  it "renders a list of version_comments" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

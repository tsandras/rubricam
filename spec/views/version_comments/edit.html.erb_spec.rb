require 'rails_helper'

RSpec.describe "version_comments/edit", :type => :view do
  before(:each) do
    @version_comment = assign(:version_comment, VersionComment.create!(
      :version => "9.99",
      :content => "MyText",
      :details => "MyText"
    ))
  end

  it "renders the edit version_comment form" do
    render

    assert_select "form[action=?][method=?]", version_comment_path(@version_comment), "post" do

      assert_select "input#version_comment_version[name=?]", "version_comment[version]"

      assert_select "textarea#version_comment_content[name=?]", "version_comment[content]"

      assert_select "textarea#version_comment_details[name=?]", "version_comment[details]"
    end
  end
end

require 'rails_helper'

RSpec.describe "version_comments/new", :type => :view do
  before(:each) do
    assign(:version_comment, VersionComment.new(
      :version => "9.99",
      :content => "MyText",
      :details => "MyText"
    ))
  end

  it "renders new version_comment form" do
    render

    assert_select "form[action=?][method=?]", version_comments_path, "post" do

      assert_select "input#version_comment_version[name=?]", "version_comment[version]"

      assert_select "textarea#version_comment_content[name=?]", "version_comment[content]"

      assert_select "textarea#version_comment_details[name=?]", "version_comment[details]"
    end
  end
end

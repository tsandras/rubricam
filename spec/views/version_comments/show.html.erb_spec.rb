require 'rails_helper'

RSpec.describe "version_comments/show", :type => :view do
  before(:each) do
    @version_comment = assign(:version_comment, VersionComment.create!(
      :version => "9.99",
      :content => "MyText",
      :details => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end

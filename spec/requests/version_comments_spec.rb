require 'rails_helper'

RSpec.describe "VersionComments", :type => :request do
  describe "GET /version_comments" do
    it "works! (now write some real specs)" do
      get version_comments_path
      expect(response).to have_http_status(200)
    end
  end
end

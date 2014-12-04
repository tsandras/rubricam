require 'rails_helper'

RSpec.describe "Royaumes", :type => :request do
  describe "GET /royaumes" do
    it "works! (now write some real specs)" do
      get royaumes_path
      expect(response).to have_http_status(200)
    end
  end
end

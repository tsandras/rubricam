require 'rails_helper'

RSpec.describe "Historiques", :type => :request do
  describe "GET /historiques" do
    it "works! (now write some real specs)" do
      get historiques_path
      expect(response).to have_http_status(200)
    end
  end
end

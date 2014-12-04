require 'rails_helper'

RSpec.describe "Lieus", :type => :request do
  describe "GET /lieus" do
    it "works! (now write some real specs)" do
      get lieus_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Spheres", :type => :request do
  describe "GET /spheres" do
    it "works! (now write some real specs)" do
      get spheres_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Objets", :type => :request do
  describe "GET /objets" do
    it "works! (now write some real specs)" do
      get objets_path
      expect(response).to have_http_status(200)
    end
  end
end

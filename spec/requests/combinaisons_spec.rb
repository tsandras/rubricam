require 'rails_helper'

RSpec.describe "Combinaisons", :type => :request do
  describe "GET /combinaisons" do
    it "works! (now write some real specs)" do
      get combinaisons_path
      expect(response).to have_http_status(200)
    end
  end
end

require "rails_helper"

RSpec.describe LieusController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lieus").to route_to("lieus#index")
    end

    it "routes to #new" do
      expect(:get => "/lieus/new").to route_to("lieus#new")
    end

    it "routes to #show" do
      expect(:get => "/lieus/1").to route_to("lieus#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lieus/1/edit").to route_to("lieus#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lieus").to route_to("lieus#create")
    end

    it "routes to #update" do
      expect(:put => "/lieus/1").to route_to("lieus#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lieus/1").to route_to("lieus#destroy", :id => "1")
    end

  end
end

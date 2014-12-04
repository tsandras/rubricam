require "rails_helper"

RSpec.describe AtoutsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/atouts").to route_to("atouts#index")
    end

    it "routes to #new" do
      expect(:get => "/atouts/new").to route_to("atouts#new")
    end

    it "routes to #show" do
      expect(:get => "/atouts/1").to route_to("atouts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/atouts/1/edit").to route_to("atouts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/atouts").to route_to("atouts#create")
    end

    it "routes to #update" do
      expect(:put => "/atouts/1").to route_to("atouts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/atouts/1").to route_to("atouts#destroy", :id => "1")
    end

  end
end

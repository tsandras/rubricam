require "rails_helper"

RSpec.describe CapacitesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/capacites").to route_to("capacites#index")
    end

    it "routes to #new" do
      expect(:get => "/capacites/new").to route_to("capacites#new")
    end

    it "routes to #show" do
      expect(:get => "/capacites/1").to route_to("capacites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/capacites/1/edit").to route_to("capacites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/capacites").to route_to("capacites#create")
    end

    it "routes to #update" do
      expect(:put => "/capacites/1").to route_to("capacites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/capacites/1").to route_to("capacites#destroy", :id => "1")
    end

  end
end

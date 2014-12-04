require "rails_helper"

RSpec.describe SpheresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spheres").to route_to("spheres#index")
    end

    it "routes to #new" do
      expect(:get => "/spheres/new").to route_to("spheres#new")
    end

    it "routes to #show" do
      expect(:get => "/spheres/1").to route_to("spheres#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spheres/1/edit").to route_to("spheres#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spheres").to route_to("spheres#create")
    end

    it "routes to #update" do
      expect(:put => "/spheres/1").to route_to("spheres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spheres/1").to route_to("spheres#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe ObjetsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/objets").to route_to("objets#index")
    end

    it "routes to #new" do
      expect(:get => "/objets/new").to route_to("objets#new")
    end

    it "routes to #show" do
      expect(:get => "/objets/1").to route_to("objets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/objets/1/edit").to route_to("objets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/objets").to route_to("objets#create")
    end

    it "routes to #update" do
      expect(:put => "/objets/1").to route_to("objets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/objets/1").to route_to("objets#destroy", :id => "1")
    end

  end
end

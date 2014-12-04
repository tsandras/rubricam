require "rails_helper"

RSpec.describe RoyaumesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/royaumes").to route_to("royaumes#index")
    end

    it "routes to #new" do
      expect(:get => "/royaumes/new").to route_to("royaumes#new")
    end

    it "routes to #show" do
      expect(:get => "/royaumes/1").to route_to("royaumes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/royaumes/1/edit").to route_to("royaumes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/royaumes").to route_to("royaumes#create")
    end

    it "routes to #update" do
      expect(:put => "/royaumes/1").to route_to("royaumes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/royaumes/1").to route_to("royaumes#destroy", :id => "1")
    end

  end
end

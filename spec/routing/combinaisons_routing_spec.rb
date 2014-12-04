require "rails_helper"

RSpec.describe CombinaisonsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/combinaisons").to route_to("combinaisons#index")
    end

    it "routes to #new" do
      expect(:get => "/combinaisons/new").to route_to("combinaisons#new")
    end

    it "routes to #show" do
      expect(:get => "/combinaisons/1").to route_to("combinaisons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/combinaisons/1/edit").to route_to("combinaisons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/combinaisons").to route_to("combinaisons#create")
    end

    it "routes to #update" do
      expect(:put => "/combinaisons/1").to route_to("combinaisons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/combinaisons/1").to route_to("combinaisons#destroy", :id => "1")
    end

  end
end

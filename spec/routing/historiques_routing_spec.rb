require "rails_helper"

RSpec.describe HistoriquesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/historiques").to route_to("historiques#index")
    end

    it "routes to #new" do
      expect(:get => "/historiques/new").to route_to("historiques#new")
    end

    it "routes to #show" do
      expect(:get => "/historiques/1").to route_to("historiques#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/historiques/1/edit").to route_to("historiques#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/historiques").to route_to("historiques#create")
    end

    it "routes to #update" do
      expect(:put => "/historiques/1").to route_to("historiques#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/historiques/1").to route_to("historiques#destroy", :id => "1")
    end

  end
end

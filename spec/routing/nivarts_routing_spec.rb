require "rails_helper"

RSpec.describe NivartsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nivarts").to route_to("nivarts#index")
    end

    it "routes to #new" do
      expect(:get => "/nivarts/new").to route_to("nivarts#new")
    end

    it "routes to #show" do
      expect(:get => "/nivarts/1").to route_to("nivarts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nivarts/1/edit").to route_to("nivarts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nivarts").to route_to("nivarts#create")
    end

    it "routes to #update" do
      expect(:put => "/nivarts/1").to route_to("nivarts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nivarts/1").to route_to("nivarts#destroy", :id => "1")
    end

  end
end

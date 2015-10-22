require "rails_helper"

RSpec.describe VersionCommentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/version_comments").to route_to("version_comments#index")
    end

    it "routes to #new" do
      expect(:get => "/version_comments/new").to route_to("version_comments#new")
    end

    it "routes to #show" do
      expect(:get => "/version_comments/1").to route_to("version_comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/version_comments/1/edit").to route_to("version_comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/version_comments").to route_to("version_comments#create")
    end

    it "routes to #update" do
      expect(:put => "/version_comments/1").to route_to("version_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/version_comments/1").to route_to("version_comments#destroy", :id => "1")
    end

  end
end

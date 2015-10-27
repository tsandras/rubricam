class RelationsOrganisation < ActiveRecord::Base
  attr_accessible :description, :from_organisation_id, :name, :secret, :to_organisation_id

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }
end

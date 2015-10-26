class RelationsOrganisation < ActiveRecord::Base
  attr_accessible :description, :from_organisation_id, :name, :secret, :to_organisation_id
end

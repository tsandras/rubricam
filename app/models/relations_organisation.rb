# == Schema Information
#
# Table name: relations_organisations
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :text
#  secret               :boolean
#  to_organisation_id   :string(255)
#  from_organisation_id :string(255)
#

class RelationsOrganisation < ActiveRecord::Base
  attr_accessible :description, :from_organisation_id, :name, :secret, :to_organisation_id

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }
end

# == Schema Information
#
# Table name: relations_organisations
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :text
#  secret               :boolean
#  to_organisation_id   :integer
#  from_organisation_id :integer
#

require 'rails_helper'

RSpec.describe RelationsOrganisation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

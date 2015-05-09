# == Schema Information
#
# Table name: lieus_organisations
#
#  id              :integer          not null, primary key
#  lieu_id         :integer
#  organisation_id :integer
#  nom             :string(255)
#  description     :text
#  date_debut      :datetime
#  date_fin        :datetime
#

class LieusOrganisations < ActiveRecord::Base
  attr_accessible :lieu_id, :organisation_id, :nom, :description, :date_debut, :date_fin

  belongs_to :organisation
  belongs_to :lieu
end

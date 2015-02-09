# == Schema Information
#
# Table name: organisations_personnages
#
#  id              :integer          not null, primary key
#  personnage_id   :integer
#  organisation_id :integer
#  nom             :string(255)
#  description     :text
#  date_debut      :datetime
#  date_fin        :datetime
#

class OrganisationsPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :organisation_id, :nom, :description, :date_debut, :date_fin

  belongs_to :personnage
  belongs_to :organisation
end

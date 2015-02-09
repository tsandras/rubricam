# == Schema Information
#
# Table name: combinaisons
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  niveau      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Combinaison < ActiveRecord::Base
  attr_accessible :description, :niveau, :nom

  has_and_belongs_to_many :disciplines, class_name: 'Discipline'
  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end

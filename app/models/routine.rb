# == Schema Information
#
# Table name: routines
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  foci        :text
#  combinaison :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  secret      :boolean
#

class Routine < ActiveRecord::Base
  attr_accessible :combinaison, :description, :foci, :name, :type, :secret

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end

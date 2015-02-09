# == Schema Information
#
# Table name: organisations
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  type        :string(255)
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Organisation < ActiveRecord::Base
  attr_accessible :date, :description, :nom, :type

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end

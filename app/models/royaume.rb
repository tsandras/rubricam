# == Schema Information
#
# Table name: royaumes
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Royaume < ActiveRecord::Base
  attr_accessible :description, :nom

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end

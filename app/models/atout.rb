# == Schema Information
#
# Table name: atouts
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  cout        :integer
#  type        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  has_detail  :boolean
#

class Atout < ActiveRecord::Base
  attr_accessible :cout, :description, :nom, :has_detail

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end

# == Schema Information
#
# Table name: atouts
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  cout        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  has_detail  :boolean
#  source      :string(255)
#

class Atout < ActiveRecord::Base
  attr_accessible :cout, :description, :nom, :has_detail, :source

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end

# == Schema Information
#
# Table name: campagnes
#
#  id                   :integer          not null, primary key
#  nom                  :string(255)
#  description          :text
#  debut                :datetime
#  description_publique :text
#  note                 :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Campagne < ActiveRecord::Base
  attr_accessible :debut, :description, :description_publique, :nom, :note, :user_ids

  has_and_belongs_to_many :users
  has_many :parties, :class_name => 'Partie'
end

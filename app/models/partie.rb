# == Schema Information
#
# Table name: parties
#
#  id                   :integer          not null, primary key
#  date                 :datetime
#  duree                :integer
#  nom                  :string(255)
#  description          :text
#  description_publique :text
#  secret               :boolean
#  image_lien           :string(255)
#  xps                  :integer
#  notes                :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  campagne_id          :integer
#

class Partie < ActiveRecord::Base
  attr_accessible :date, :description, :description_publique, :duree, :image_lien,
                  :nom, :notes, :secret, :xps, :personnage_ids, :campagne_id, :campagne, :user_ids

  validates_presence_of :date, :nom

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :users, class_name: 'User'
  belongs_to :campagne

  def self.played_by(user)
    partie_ids = []
    user.campagnes.each do |campagne| 
      campagne.parties.each do |partie| 
        partie_ids << partie.id
      end
    end
    Partie.where(id: partie_ids)
  end
end

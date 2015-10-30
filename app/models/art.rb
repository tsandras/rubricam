# == Schema Information
#
# Table name: arts
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  secret      :boolean
#  source      :string(255)
#  attribut    :string(255)
#

class Art < ActiveRecord::Base
  attr_accessible :description, :nom, :secret, :source, :attribut, :nivart_ids

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_many :nivarts, class_name: 'Nivart', foreign_key: 'art_id'
end

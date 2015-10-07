# == Schema Information
#
# Table name: nivdisciplines
#
#  id             :integer          not null, primary key
#  nom            :string(255)
#  description    :text
#  niveau         :integer
#  source         :string(255)
#  discipline_id  :integer
#  discipline_nom :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  systeme        :text
#  tableau        :text
#  secret         :boolean
#

class Nivdiscipline < ActiveRecord::Base
  attr_accessible :description, :nom, :niveau, :source, :discipline_id,
                  :discipline_nom, :systeme, :tableau, :secret

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  belongs_to :discipline

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }
  scope :secret, lambda { where("secret = ?", true) }
end

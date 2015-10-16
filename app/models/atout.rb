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
#  type_atout  :string(255)
#  secret      :boolean
#

class Atout < ActiveRecord::Base
  attr_accessible :cout, :description, :nom, :has_detail, :source, :type_atout, :secret

  validates_presence_of :description, :nom, :cout, :source, :type_atout

  has_and_belongs_to_many :personnages, class_name: 'Personnage'

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }

  TYPE_ATOUT = ["Physique", "Social", "Mental", "Surnaturel"]
  SOURCE = ["V20", "M20", "Personnelle", "Autre"]
end

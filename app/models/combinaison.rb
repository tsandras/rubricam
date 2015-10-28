# == Schema Information
#
# Table name: combinaisons
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  cout        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  secret      :boolean
#

class Combinaison < ActiveRecord::Base
  attr_accessible :description, :cout, :nom, :secret, :user_id, :discipline_ids

  has_and_belongs_to_many :disciplines, class_name: 'Discipline'
  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  belongs_to :user

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }
  scope :own_routines, ->(user_id) { where("user_id = ?", user_id) }
  scope :none_secret_or_own_routines, ->(user_id) { where("user_id = ? or secret = ? or secret is null", user_id, false) }

  validates_presence_of :nom, :cout, :description
end

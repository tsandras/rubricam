# == Schema Information
#
# Table name: nivarts
#
#  id          :integer          not null, primary key
#  art_id      :integer
#  art_nom     :string(255)
#  nom         :string(255)
#  niveau      :integer
#  description :text
#  source      :string(255)
#  systeme     :text
#  tableau     :text
#  secret      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Nivart < ActiveRecord::Base
  attr_accessible :art_id, :art_nom, :description, :niveau, :nom, :secret, :source, :systeme, :tableau

  belongs_to :discipline

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }
  scope :secret, lambda { where("secret = ?", true) }
end

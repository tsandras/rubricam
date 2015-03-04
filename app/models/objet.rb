# == Schema Information
#
# Table name: objets
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  niveau        :integer
#  type          :string(255)
#  resonnance    :string(255)
#  personnage_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  secret        :boolean
#

class Objet < ActiveRecord::Base
  attr_accessible :description, :name, :niveau, :personnage_id, :resonnance, :type, :secret

  belongs_to :personnage
end

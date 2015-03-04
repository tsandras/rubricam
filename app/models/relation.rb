# == Schema Information
#
# Table name: relations
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  date               :datetime
#  to_personnage_id   :integer
#  from_personnage_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  secret             :boolean
#

class Relation < ActiveRecord::Base
  attr_accessible :date, :description, :name, :to_personnage_id, :from_personnage_id, :secret

  belongs_to :personnage, :class_name => 'Personnage', :foreign_key => 'to_personnage_id'
  belongs_to :personnage, :class_name => 'Personnage', :foreign_key => 'from_personnage_id'
end

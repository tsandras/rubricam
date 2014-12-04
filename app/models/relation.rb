class Relation < ActiveRecord::Base
  attr_accessible :date, :description, :name, :to_personnage_id, :from_personnage_id

  belongs_to :personnage, :class_name => 'Personnage', :foreign_key => 'to_personnage_id'
  belongs_to :personnage, :class_name => 'Personnage', :foreign_key => 'from_personnage_id'
end

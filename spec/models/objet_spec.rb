# == Schema Information
#
# Table name: objets
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  niveau        :integer
#  type_objet    :string(255)
#  resonnance    :string(255)
#  personnage_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  secret        :boolean
#  valeur        :integer
#  dynamique     :integer
#  statique      :integer
#  entropique    :integer
#  routine_id    :integer
#  user_id       :integer
#

require 'rails_helper'

RSpec.describe Objet, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

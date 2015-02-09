# == Schema Information
#
# Table name: spheres
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  specialite    :string(255)
#  description   :text
#  niveau        :integer
#  personnage_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Sphere, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

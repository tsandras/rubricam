# == Schema Information
#
# Table name: objets_routines
#
#  id         :integer          not null, primary key
#  objet_id   :integer
#  routine_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ObjetsRoutines, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

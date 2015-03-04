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

require 'rails_helper'

RSpec.describe Objet, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

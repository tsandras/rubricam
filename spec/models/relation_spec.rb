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

require 'rails_helper'

RSpec.describe Relation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: lieus
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Lieu, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: routines
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  foci        :text
#  combinaison :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  secret      :boolean
#

require 'rails_helper'

RSpec.describe Routine, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

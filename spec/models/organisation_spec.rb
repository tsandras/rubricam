# == Schema Information
#
# Table name: organisations
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  type        :string(255)
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Organisation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

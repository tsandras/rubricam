# == Schema Information
#
# Table name: royaumes
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  source      :string(255)
#  capacites   :string(255)
#

require 'rails_helper'

RSpec.describe Royaume, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

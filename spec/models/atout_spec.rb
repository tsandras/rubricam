# == Schema Information
#
# Table name: atouts
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  cout        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  has_detail  :boolean
#  source      :string(255)
#  type_atout  :string(255)
#  secret      :boolean
#

require 'rails_helper'

RSpec.describe Atout, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

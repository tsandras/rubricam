# == Schema Information
#
# Table name: historiques
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  has_detail  :boolean
#

require 'rails_helper'

RSpec.describe Historique, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

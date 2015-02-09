# == Schema Information
#
# Table name: capacites
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  primaire    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  type_cap    :string(255)
#

require 'rails_helper'

RSpec.describe Capacite, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

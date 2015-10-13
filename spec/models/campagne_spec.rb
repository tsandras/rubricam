# == Schema Information
#
# Table name: campagnes
#
#  id                   :integer          not null, primary key
#  nom                  :string(255)
#  description          :text
#  debut                :datetime
#  description_publique :text
#  note                 :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe Campagne, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

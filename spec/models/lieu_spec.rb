# == Schema Information
#
# Table name: lieus
#
#  id                   :integer          not null, primary key
#  nom                  :string(255)
#  description          :text(255)
#  type_lieu            :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  secret               :boolean
#  description_publique :text
#  image_lien           :string(255)
#

require 'rails_helper'

RSpec.describe Lieu, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

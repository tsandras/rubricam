# == Schema Information
#
# Table name: organisations
#
#  id                   :integer          not null, primary key
#  nom                  :string(255)
#  description          :text
#  type_organisation    :string(255)
#  date                 :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  secret               :boolean
#  description_publique :text
#  image_lien           :string(255)
#  avatar               :string(255)
#

require 'rails_helper'

RSpec.describe Organisation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

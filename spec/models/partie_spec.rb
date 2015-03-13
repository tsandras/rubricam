# == Schema Information
#
# Table name: parties
#
#  id                   :integer          not null, primary key
#  date                 :datetime
#  duree                :integer
#  nom                  :string(255)
#  description          :text
#  description_publique :text
#  secret               :boolean
#  image_lien           :string(255)
#  xps                  :integer
#  notes                :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe Partie, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

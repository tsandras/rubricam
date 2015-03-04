# == Schema Information
#
# Table name: disciplines
#
#  id             :integer          not null, primary key
#  nom            :string(255)
#  description    :text
#  nom_discipline :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  source         :string(255)
#  secret         :boolean
#

require 'rails_helper'

RSpec.describe Discipline, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

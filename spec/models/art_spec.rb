# == Schema Information
#
# Table name: arts
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  secret      :boolean
#  source      :string(255)
#  attribut    :string(255)
#

require 'rails_helper'

RSpec.describe Art, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

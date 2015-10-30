# == Schema Information
#
# Table name: nivarts
#
#  id          :integer          not null, primary key
#  art_id      :integer
#  art_nom     :string(255)
#  nom         :string(255)
#  niveau      :integer
#  description :text
#  source      :string(255)
#  systeme     :text
#  tableau     :text
#  secret      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Nivart, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

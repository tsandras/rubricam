# == Schema Information
#
# Table name: combinaisons
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  cout        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  secret      :boolean
#

require 'rails_helper'

RSpec.describe Combinaison, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

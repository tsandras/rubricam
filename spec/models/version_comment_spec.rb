# == Schema Information
#
# Table name: version_comments
#
#  id         :integer          not null, primary key
#  version    :integer
#  subversion :integer
#  liberation :datetime
#  content    :text
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe VersionComment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

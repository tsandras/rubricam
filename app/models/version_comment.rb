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

class VersionComment < ActiveRecord::Base
  attr_accessible :content, :details, :version, :subversion, :liberation

  scope :last_version, lambda { order("liberation desc") }
end

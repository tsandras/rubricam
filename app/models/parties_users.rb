# == Schema Information
#
# Table name: parties_users
#
#  id        :integer          not null, primary key
#  user_id   :integer
#  partie_id :integer
#

class PartiesUsers < ActiveRecord::Base
  attr_accessible :partie_id, :user_id

  belongs_to :user
  belongs_to :partie
end

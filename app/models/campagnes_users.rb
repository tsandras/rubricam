# == Schema Information
#
# Table name: campagnes_users
#
#  id          :integer          not null, primary key
#  campagne_id :integer
#  user_id     :integer
#

class CampagnesUsers < ActiveRecord::Base
  attr_accessible :campagne_id, :user_id

  belongs_to :campagne
  belongs_to :user
end

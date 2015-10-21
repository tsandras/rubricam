class PartiesUsers < ActiveRecord::Base
  attr_accessible :partie_id, :user_id

  belongs_to :user
  belongs_to :partie
end

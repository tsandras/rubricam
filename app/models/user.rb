# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  pseudo                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  role                   :integer          default(0), not null
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable, :token_authenticatable, :validatable
  devise :confirmable # this parameter will make devise send out a confirmation email, almost working

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :pseudo, :role

  validate :value_of_role

  ROLE_ADMIN = 2
  ROLE_MODER = 1
  ROLE_NORMA = 0

  ROLES = [["Admin", ROLE_NORMA], ["Modérateur", ROLE_MODER], ["Utilisateur", ROLE_NORMA]]
  ROLE_IDS = {"Utilisateur" => 0, "Modérateur" => 1, "Admin" => 2}

  has_many :personnages
  has_many :objets
  has_many :routines
  has_and_belongs_to_many :campagnes
  has_and_belongs_to_many :parties, class_name: 'Partie'

  def role_name
    if role == ROLE_ADMIN
      "Admin"
    elsif role == ROLE_MODER
      "Modérateur"
    elsif role == ROLE_NORMA
      "Utilisateur"
    else
      "Erreur"
    end
  end

  def value_of_role
    return false if role.blank?
    return true if role >= 0 && role <= 2
    false
  end
end

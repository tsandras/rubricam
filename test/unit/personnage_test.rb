# == Schema Information
#
# Table name: personnages
#
#  id                    :integer          not null, primary key
#  nom                   :string(255)
#  prenom                :string(255)
#  date_naissance        :datetime
#  description           :text
#  volonte               :integer
#  background            :text
#  force                 :integer
#  dexterite             :integer
#  vigueur               :integer
#  charisme              :integer
#  manipulation          :integer
#  apparence             :integer
#  perception            :integer
#  intelligence          :integer
#  astuce                :integer
#  paradygme             :text
#  xps                   :integer
#  bonus                 :integer
#  date_mort             :datetime
#  points_conscience     :integer
#  points_maitrise       :integer
#  points_courage        :integer
#  points_dynamique      :integer
#  points_statique       :integer
#  points_entropique     :integer
#  entelechie            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  spec_force            :string(255)
#  spec_dexterite        :string(255)
#  spec_vigueur          :string(255)
#  spec_charisme         :string(255)
#  spec_manipulation     :string(255)
#  spec_apparence        :string(255)
#  spec_perception       :string(255)
#  spec_intelligence     :string(255)
#  spec_astuce           :string(255)
#  reste_xps             :integer
#  type_perso            :string(255)
#  nature                :string(255)
#  attitude              :string(255)
#  rang                  :integer
#  points_sang           :integer
#  glamour               :integer
#  banalite              :integer
#  niveau_voie           :integer
#  voie                  :string(255)
#  tradition             :string(255)
#  clan                  :string(255)
#  caracteristique_base  :text
#  caracteristique_bonus :text
#  reste_bonus           :string(255)
#  has_base              :boolean
#  has_bonus             :boolean
#  user_id               :integer
#  secret                :boolean          default(FALSE)
#  description_publique  :text
#  image_lien            :string(255)
#  niveau_physique       :integer
#  niveau_social         :integer
#  niveau_mental         :integer
#  niveau_magdynamique   :integer
#  niveau_magstatique    :integer
#  niveau_ressources     :integer
#  pnj                   :boolean          default(FALSE)
#  nom_publique          :string(255)
#  detail_dynamique      :string(255)
#  detail_statique       :string(255)
#  detail_entropique     :string(255)
#  avatar                :string(255)
#  appartenance_perso    :string(255)
#  lock                  :boolean
#  trace                 :text
#  appartenance_publique :string(255)
#  rang_publique         :string(255)
#

require 'test_helper'

class PersonnageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

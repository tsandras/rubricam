class AccueilController < ApplicationController

  def index
    @personnages = Personnage.own_personnages(@user.id)
    @pnjs = Personnage.none_secret_and_pnjs.limit(10)
    @historiques = Historique.order('created_at DESC').limit(10)
    @atouts = Atout.order('created_at DESC').limit(10)
    @disciplines = Discipline.order('created_at DESC').limit(10)
    @capacites = Capacite.order('created_at DESC').limit(10)
  end

  def carte
    @user = User.first
    @lieux_villes = Lieu
      .includes(:organisations, :personnages)
      .locatable
      .lieu_ou_ville
  end
end

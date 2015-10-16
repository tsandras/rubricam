class AccueilController < ApplicationController

  def index
    @personnages = Personnage.own_personnages(@user.id).order("created_at desc").limit(10)
    @pnjs = Personnage.none_secret_and_pnjs.limit(10)
    @historiques = Historique.order('created_at DESC').limit(10)
    @atouts = Atout.none_secret.order('created_at DESC').limit(10)
    @disciplines = Discipline.none_secret.order('created_at DESC').limit(10)
    @capacites = Capacite.order('created_at DESC').limit(10)
  end

  def carte
    @lieux_villes = Lieu
      .includes(:organisations, :personnages)
      .locatable
      .lieu_ou_ville
  end

  def navigation
    
  end
end

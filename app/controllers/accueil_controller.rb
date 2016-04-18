class AccueilController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:cv_elyse_cordeau]

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
      .includes(:organisations, :personnages, :nodes)
      .locatable
      .lieu_ou_ville
  end

  def navigation
    
  end

  def cv_elyse_cordeau
    File.open('app/views/accueil/cv_elyse_cordeau.pdf', 'r') do |f|
      send_data f.read.force_encoding('BINARY'), :filename => "cv_elyse_cordeau.pdf", :type => "application/pdf", :disposition => "attachment"
    end
  end
end

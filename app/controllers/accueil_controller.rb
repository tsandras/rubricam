class AccueilController < ApplicationController

  def index
    @user = User.find(session["warden.user.user.key"][0].first)
    @personnages = Personnage.where(user_id: @user.id)
    @historiques = Historique.order('created_at DESC').limit(10)
    @atouts = Atout.order('created_at DESC').limit(10)
    @disciplines = Discipline.order('created_at DESC').limit(10)
    @capacites = Capacite.order('created_at DESC').limit(10)
  end
end

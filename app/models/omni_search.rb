class OmniSearch
  attr_accessor :input, :text_like, :results

  def initialize(user, params)
    if params.present?
      @input = params[:text]
      @text_like = "%#{@input}%"
      @results = []
      @user = user
    end
  end

  def global
    if @user.id.present?
      search_personnages
      search_organisations
      search_lieus
      search_routines
      search_objets
      search_combinaisons
    end
    search_disciplines
    search_atouts
    search_historiques
    search_capacites
  end

  def search_personnages
    if @user.role != User::ROLE_ADMIN
      res = Personnage.none_secret.order("created_at desc")
    else
      res = Personnage.order("created_at desc")
    end
    res = res
      .where("UPPER(nom) like (?) or UPPER(prenom) like (?)", @text_like.upcase, @text_like.upcase)
      .limit(15)
    @results = @results + res
  end

  def search_organisations
    if @user.role != User::ROLE_ADMIN
      res = Organisation.none_secret.order("created_at desc")
    else
      res = Organisation.order("created_at desc")
    end
    res = res
      .where("UPPER(nom) like (?)", @text_like.upcase)
      .limit(15)
    @results = @results + res
  end

  def search_disciplines
    if @user.role != User::ROLE_ADMIN
      res = Discipline.none_secret.order("created_at desc")
    else
      res = Discipline.order("created_at desc")
    end
    res = res
      .where("UPPER(nom) like (?)", @text_like.upcase)
      .limit(15)
    @results = @results + res
  end

  def search_atouts
    if @user.role != User::ROLE_ADMIN
      res = Atout.none_secret.order("created_at desc")
    else
      res = Atout.order("created_at desc")
    end
    res = res
      .where("UPPER(nom) like (?)", @text_like.upcase)
      .limit(15)
    @results = @results + res
  end

  def search_historiques
    @results = @results + Historique
      .order("created_at desc")
      .where("UPPER(nom) like (?)", @text_like.upcase)
      .limit(15)
  end

  def search_capacites
    @results = @results + Capacite
      .order("created_at desc")
      .where("UPPER(nom) like (?)", @text_like.upcase)
      .limit(15)
  end

  def search_lieus
    if @user.role != User::ROLE_ADMIN
      res = Lieu.none_secret.order("created_at desc")
    else
      res = Lieu.order("created_at desc")
    end
    res = res
      .where("UPPER(nom) like (?)", @text_like.upcase)
      .limit(15)
    @results = @results + res
  end

  def search_routines
    if @user.role != User::ROLE_ADMIN
      res = Routine.none_secret.order("created_at desc")
    else
      res = Routine.order("created_at desc")
    end
    res = res
      .where("UPPER(name) like (?)", @text_like.upcase)
      .limit(15)
    @results = @results + res
  end

  def search_objets
    if @user.role != User::ROLE_ADMIN
      res = Objet.none_secret.order("created_at desc")
    else
      res = Objet.order("created_at desc")
    end
    res = res
      .where("UPPER(name) like (?)", @text_like.upcase)
      .limit(15)
    @results = @results + res
  end

  def search_combinaisons
    if @user.role != User::ROLE_ADMIN
      res = Combinaison.none_secret.order("created_at desc")
    else
      res = Combinaison.order("created_at desc")
    end
    res = res
      .where("UPPER(nom) like (?)", @text_like.upcase)
      .limit(15)
    @results = @results + res
  end
end

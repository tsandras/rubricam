class PersonnagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:get_infos]
  skip_before_filter :authenticate_user!, only: [:get_infos]

  def index
    @user = User.find(session["warden.user.user.key"][0].first)
    if @user.role != 0
      @personnages = Personnage.all
    else
      @personnages = Personnage.where(user_id: @user.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personnages }
    end
  end

  def show
    @personnage = Personnage.find(params[:id])
    return redirect_to root_url if !permition?(User.find(session["warden.user.user.key"][0].first))
    @capacites = CapacitesPersonnages.where(personnage_id: params[:id])
    @historiques = HistoriquesPersonnages.where(personnage_id: params[:id])
    @atouts = AtoutsPersonnages.where(personnage_id: params[:id])
    @to_relations = Relation.where(to_personnage_id: params[:id])
    @from_relations = Relation.where(from_personnage_id: params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personnage }
    end
  end

  def new
    @personnage = Personnage.new
    gon.traditions = Personnage::TRADITION_DESCRIPTION
    gon.clans = Personnage::CLAN_DESCRIPTION
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personnage }
    end
  end

  def edit
    @personnage = Personnage.find(params[:id])
    return redirect_to root_url if !permition?(User.find(session["warden.user.user.key"][0].first))
    gon.bonus = @personnage.has_bonus
    gon.base = @personnage.has_base
    @capacites_personnages = CapacitesPersonnages.where(personnage_id: params[:id])
    @historiques_personnages = HistoriquesPersonnages.where(personnage_id: params[:id])
    @disciplines_personnages = DisciplinesPersonnages.where(personnage_id: params[:id])
    @atouts_personnages = AtoutsPersonnages.where(personnage_id: params[:id])
    add_discipline_clan(@personnage.clan) if @personnage.vampire?
    add_historique
    add_capacite
  end

  def create
    @user = User.find(session["warden.user.user.key"][0].first)
    params[:personnage].delete("capacite_ids")
    params[:personnage].delete("historique_ids")
    params[:personnage].delete("discipline_ids")
    @personnage = Personnage.new(params[:personnage])
    @personnage.user = @user
    @personnage.entelechie = 1 if @personnage.mage?
    volonte_base
    vertues_base
    respond_to do |format|
      if @personnage.save()
        format.html { redirect_to edit_personnage_path(@personnage), notice: 'Personnage was successfully created.' }
        format.json { render action: 'edit', status: :created, location: @personnage }
      else
        format.html { render action: "new" }
        format.json { render json: @personnage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params[:personnage].delete("capacite_ids")
    params[:personnage].delete("historique_ids")
    params[:personnage].delete("discipline_ids")
    @personnage = Personnage.find(params[:id])
    return redirect_to root_url if !permition?(User.find(session["warden.user.user.key"][0].first))
    # update_atouts(params[:atouts_personnages])
    ok = false
    unless @personnage.has_base
        if @personnage.ok_base(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          params[:personnage][:has_base] = true
          params[:personnage][:caracteristique_base] = @personnage.create_caracteristique_base(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          ok = true
        else
          params[:personnage][:has_base] = false
        end
    else
      unless @personnage.has_bonus
        if @personnage.ok_bonus(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:atouts_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          params[:personnage][:has_bonus] = true
          params[:personnage][:caracteristique_bonus] = @personnage.create_caracteristique_bonus(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:atouts_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          ok = true
        else
          params[:personnage][:has_bonus] = false
        end
      else
        ok = true
      end
    end
    respond_to do |format|
      if ok && @personnage.valid?
        @personnage.update_attributes(params[:personnage])
        update_capacites(params[:capacites_personnages])
        update_historiques(params[:historiques_personnages])
        update_spheres(params[:spheres_personnages])
        update_disciplines(params[:disciplines_personnages])
        format.html { redirect_to @personnage, notice: 'Personnage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_personnage_path(@personnage) }
      end
    end
  end

# For Ajax test
  def get_infos
    respond_to do |format|
      format.html "toto"
      # format.json { render json: {"foo" => 1} }
    end
  end

  def destroy
    @personnage = Personnage.find(params[:id])
    redirect_to root_url if !permition?(User.find(session["warden.user.user.key"][0].first))
    @personnage.destroy

    respond_to do |format|
      format.html { redirect_to personnages_url }
      format.json { head :no_content }
    end
  end

  private

  def permition?(user)
    return true if user.role != 0
    return true if @personnage.user == user
    false
  end

  def volonte_base
    if @personnage.vampire?
      @personnage.volonte = 3
    elsif @personnage.mage?
      @personnage.volonte = 5
    else
      @personnage.volonte = 1
    end
  end

  def vertues_base
    if @personnage.vampire?
      @personnage.points_conscience = 1
      @personnage.points_maitrise = 1
      @personnage.points_courage = 1
    end
  end

  def add_capacite
    caps = Capacite.where(primaire: true) # To do : uniq
    caps.each do |c|
      if !is_cp_by_id_cp(c.id)
        unless (@personnage.vampire? && c.nom == "Conscience") ||
               (@personnage.mage? && c.nom == "Intuition") ||
               (@personnage.vampire? && c.nom == "Méditation") ||
               (@personnage.mage? && c.nom == "Larcin")
          CapacitesPersonnages.create(personnage_id: @personnage.id, capacite_id: c.id, niveau: 0)
        end
      end
    end
  end

  def add_historique
    if (@personnage.vampire? || @personnage.mage?)
      if (@personnage.vampire?)
        his = Historique.where(nom: "Génération").first
      elsif (@personnage.mage?)
        his = Historique.where(nom: "Avatar").first
      end
      if !is_hp_by_id_hp(his.id)
        HistoriquesPersonnages.create(personnage_id: @personnage.id, historique_id: his.id, niveau: 0)
      end
    end
  end

  def add_discipline_clan(clan)
    (0..2).each do |i|
      dis = Discipline.where(nom: Personnage::DISCIPLINES_CLAN[clan][i]).first
      # raise dis.id.inspect
      if !is_dp_by_id_dp(dis.id)
        DisciplinesPersonnages.create(personnage_id: @personnage.id, discipline_id: dis.id, niveau: 0)
      end
    end
  end

  def update_capacites(capacites_personnages)
    if capacites_personnages != nil
      capacites_personnages.each do |i, cp|
        if is_cp(i)
          cap = CapacitesPersonnages.where(id: i, personnage_id: @personnage.id)
          cap.first.update_attributes(cp)
        else
          cap_f = Capacite.find(i)
          CapacitesPersonnages.create(personnage_id: @personnage.id, capacite_id: cap_f.id, niveau: cp[:niveau], specialite: cp[:specialite])
        end
      end
    end
  end

  def update_historiques(historiques_personnages)
    if historiques_personnages != nil
      historiques_personnages.each do |i, cp|
        if is_hp(i)
          cap = HistoriquesPersonnages.find(i)
          cap.update_attributes(cp)
        else
          HistoriquesPersonnages.create(personnage_id: @personnage.id, historique_id: i.to_i, niveau: cp[:niveau])
        end
      end
    end
  end

  def update_disciplines(disciplines_personnages)
    if disciplines_personnages != nil
      # raise "disciplines !"
      disciplines_personnages.each do |i, cp|
        if is_dp(i)
          cap = DisciplinesPersonnages.where(id: i, personnage_id: @personnage.id)
          cap.first.update_attributes(cp)
        else
          DisciplinesPersonnages.create(personnage_id: @personnage.id, discipline_id: i.to_i, niveau: cp[:niveau])
        end
      end
    end
  end

  def update_spheres(spheres_personnages)
    if spheres_personnages != nil
      spheres_personnages.each do |i, cp|
        sph = Sphere.find(i)
        # raise cp["niveau"].inspect if cp["niveau"].to_i != 0
        sph.update_attributes(cp)
        sph.update_attribute(:personnage_id,  @personnage.id) if sph.personnage_id.blank?
      end
    end
  end

  def is_cp(key)
    begin
      cap = CapacitesPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_hp(key)
    begin
      cap = HistoriquesPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_dp(key)
    begin
      cap = DisciplinesPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end


  def is_dp_by_id_dp(key)
    begin
      cap = DisciplinesPersonnages.where(discipline_id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_hp_by_id_hp(key)
    begin
      cap = HistoriquesPersonnages.where(historique_id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_cp_by_id_cp(key)
    begin
      cap = CapacitesPersonnages.where(capacite_id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  # def has_sp(key)
  #   begin
  #     cap = Sphere.where(id: key, personnage_id: @personnage.id)
  #   rescue ActiveRecord::RecordNotFound => e
  #     cap = nil
  #   end
  #   return true if cap.count > 0
  #   false
  # end

end
